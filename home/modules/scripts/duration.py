#!/usr/bin/env python3
"""duration - Calculate the total playback duration of media files and directories.

Uses ffprobe (from ffmpeg) to inspect audio and video files.
Recursively scans directories by default, with an optional flat flag.
Accepts multiple files and/or directories as arguments.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import json
import os
import shutil
import subprocess
import sys
from pathlib import Path
from typing import NamedTuple

DEFAULT_MEDIA_EXTENSIONS = {
    # Video containers and codecs
    ".3g2",
    ".3gp",
    ".asf",
    ".avi",
    ".bik",
    ".divx",
    ".f4v",
    ".flv",
    ".h264",
    ".h265",
    ".hevc",
    ".m2t",
    ".m2ts",
    ".m4v",
    ".mkv",
    ".mov",
    ".mp4",
    ".mpeg",
    ".mpg",
    ".mts",
    ".mxf",
    ".ogv",
    ".rm",
    ".rmvb",
    ".ts",
    ".vob",
    ".webm",
    ".wmv",
    ".wtv",
    # Audio containers and codecs
    ".aac",
    ".ac3",
    ".aif",
    ".aiff",
    ".alac",
    ".amr",
    ".ape",
    ".au",
    ".dts",
    ".flac",
    ".m4a",
    ".m4b",
    ".m4p",
    ".mid",
    ".midi",
    ".mka",
    ".mp2",
    ".mp3",
    ".mpa",
    ".oga",
    ".ogg",
    ".opus",
    ".ra",
    ".wav",
    ".weba",
    ".wma",
    ".wv",
}


class MediaFile(NamedTuple):
    path: Path
    duration: float
    target: Path


def get_ffprobe_path() -> str:
    path = os.environ.get("FFPROBE_PATH")
    if path and os.path.isfile(path) and os.access(path, os.X_OK):
        return path
    which_path = shutil.which("ffprobe")
    if which_path:
        return which_path
    sys.stderr.write(
        "Error: 'ffprobe' not found in PATH or FFPROBE_PATH. Please install ffmpeg.\n"
    )
    sys.exit(1)


def parse_tag_duration(val: str) -> float | None:
    """Parse duration strings formatted as HH:MM:SS[.mmm] or MM:SS[.mmm]."""
    try:
        parts = val.strip().split(":")
        if len(parts) == 3:
            h = float(parts[0])
            m = float(parts[1])
            s = float(parts[2])
            return h * 3600 + m * 60 + s
        if len(parts) == 2:
            m = float(parts[0])
            s = float(parts[1])
            return m * 60 + s
    except (ValueError, IndexError):
        return None
    return None


def probe_duration(
    ffprobe_bin: str, file_path: Path, verbose: bool = False
) -> float | None:
    """Run ffprobe on a file to extract its duration in seconds."""
    cmd = [
        ffprobe_bin,
        "-v",
        "error",
        "-show_entries",
        "format=duration:stream=duration",
        "-show_entries",
        "format_tags=DURATION,duration:stream_tags=DURATION,duration",
        "-of",
        "json",
        str(file_path),
    ]

    try:
        res = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except (subprocess.SubprocessError, OSError) as exc:
        if verbose:
            sys.stderr.write(f"Warning: Failed to probe '{file_path}': {exc}\n")
        return None

    if res.returncode != 0:
        if verbose:
            sys.stderr.write(
                f"Warning: ffprobe failed for '{file_path}': {res.stderr.strip()}\n"
            )
        return None

    try:
        data = json.loads(res.stdout)
    except json.JSONDecodeError:
        return None

    # 1. Format duration
    fmt = data.get("format", {})
    dur_str = fmt.get("duration")
    if dur_str and dur_str != "N/A":
        try:
            val = float(dur_str)
            if val > 0:
                return val
        except ValueError:
            pass

    # 2. Streams duration (take max stream duration)
    streams = data.get("streams", [])
    max_stream_dur = 0.0
    for s in streams:
        dur_str = s.get("duration")
        if dur_str and dur_str != "N/A":
            try:
                val = float(dur_str)
                max_stream_dur = max(max_stream_dur, val)
            except ValueError:
                pass
    if max_stream_dur > 0:
        return max_stream_dur

    # 3. Format tags (e.g. Matroska / WebM tag metadata)
    fmt_tags = fmt.get("tags") or {}
    for key in ("DURATION", "duration"):
        if key in fmt_tags:
            tag_dur = parse_tag_duration(fmt_tags[key])
            if tag_dur and tag_dur > 0:
                return tag_dur

    # 4. Stream tags
    for s in streams:
        s_tags = s.get("tags") or {}
        for key in ("DURATION", "duration"):
            if key in s_tags:
                tag_dur = parse_tag_duration(s_tags[key])
                if tag_dur and tag_dur > 0:
                    return tag_dur

    return None


def collect_candidate_files(
    targets: list[Path],
    flat: bool,
    custom_extensions: set[str] | None,
    all_files: bool,
    verbose: bool = False,
) -> list[tuple[Path, Path]]:
    """Collect (file_path, target_root) tuples based on recursion and extension settings."""
    candidates: list[tuple[Path, Path]] = []
    seen: set[Path] = set()

    for target in targets:
        if not target.exists():
            sys.stderr.write(f"Error: Path does not exist: '{target}'\n")
            continue

        resolved_target = target.resolve()
        if target.is_file():
            # Directly specified files are probed regardless of default extension filter
            if resolved_target not in seen:
                seen.add(resolved_target)
                candidates.append((target, target))
        elif target.is_dir():
            if flat:
                try:
                    with os.scandir(target) as it:
                        for entry in it:
                            if entry.is_file():
                                p = Path(entry.path)
                                ext = p.suffix.lower()
                                if (
                                    all_files
                                    or (custom_extensions and ext in custom_extensions)
                                    or (
                                        not custom_extensions
                                        and ext in DEFAULT_MEDIA_EXTENSIONS
                                    )
                                ):
                                    res_p = p.resolve()
                                    if res_p not in seen:
                                        seen.add(res_p)
                                        candidates.append((p, target))
                except OSError as exc:
                    if verbose:
                        sys.stderr.write(
                            f"Warning: Could not read directory '{target}': {exc}\n"
                        )
            else:
                for root, dirs, files in os.walk(target):
                    # Exclude hidden directories unless the target itself was hidden
                    dirs[:] = [
                        d
                        for d in dirs
                        if not d.startswith(".")
                        or (target.name.startswith(".") and root == str(target))
                    ]
                    for fname in files:
                        if fname.startswith("."):
                            continue
                        p = Path(root) / fname
                        ext = p.suffix.lower()
                        if (
                            all_files
                            or (custom_extensions and ext in custom_extensions)
                            or (
                                not custom_extensions
                                and ext in DEFAULT_MEDIA_EXTENSIONS
                            )
                        ):
                            res_p = p.resolve()
                            if res_p not in seen:
                                seen.add(res_p)
                                candidates.append((p, target))

    return candidates


def format_clock(seconds: float, show_ms: bool = False) -> str:
    """Format seconds into HH:MM:SS or Dd HH:MM:SS format."""
    total_sec = int(seconds)
    days, rem = divmod(total_sec, 86400)
    hours, rem = divmod(rem, 3600)
    minutes, secs = divmod(rem, 60)

    if days > 0:
        res = f"{days}d {hours:02d}:{minutes:02d}:{secs:02d}"
    else:
        res = f"{hours:02d}:{minutes:02d}:{secs:02d}"

    if show_ms:
        ms = round((seconds - total_sec) * 100)
        if ms > 0:
            res += f".{ms:02d}"
    return res


def format_human(seconds: float) -> str:
    """Format seconds into human-readable representation like '1h 23m 45s'."""
    total_sec = round(seconds)
    days, rem = divmod(total_sec, 86400)
    hours, rem = divmod(rem, 3600)
    minutes, secs = divmod(rem, 60)

    parts: list[str] = []
    if days > 0:
        parts.append(f"{days}d")
    if hours > 0:
        parts.append(f"{hours}h")
    if minutes > 0:
        parts.append(f"{minutes}m")
    if secs > 0 or not parts:
        parts.append(f"{secs}s")

    return " ".join(parts)


def format_display_path(p: Path) -> str:
    """Format a path for concise display, relative to cwd if inside cwd."""
    try:
        rel = p.relative_to(Path.cwd())
        return str(rel)
    except ValueError:
        return str(p)


def main() -> None:
    parser = argparse.ArgumentParser(
        prog="duration",
        description="Calculate total playback duration of media files and directories.",
    )
    parser.add_argument(
        "paths",
        nargs="*",
        default=["."],
        help="Files or directories to inspect (default: current directory)",
    )
    parser.add_argument(
        "-f",
        "--flat",
        action="store_true",
        help="Do not recurse into subdirectories (scan top-level only)",
    )
    parser.add_argument(
        "-s",
        "--summary",
        action="store_true",
        help="Display summary only (do not list individual files)",
    )
    parser.add_argument(
        "-a",
        "--all",
        action="store_true",
        help="Probe all files, ignoring media extension filter",
    )
    parser.add_argument(
        "-e",
        "--ext",
        "--extension",
        action="append",
        dest="extensions",
        help="Filter by specific file extension (e.g. -e mp3 -e wav); can be repeated",
    )
    parser.add_argument(
        "-j",
        "--json",
        action="store_true",
        help="Output results in JSON format",
    )
    parser.add_argument(
        "--sort",
        choices=["path", "name", "duration"],
        default="path",
        help="Sort file listing by path, name, or duration (default: path)",
    )
    parser.add_argument(
        "-r",
        "--reverse",
        action="store_true",
        help="Reverse sort order",
    )
    parser.add_argument(
        "-t",
        "--threads",
        type=int,
        default=None,
        help="Number of concurrent worker threads (default: auto)",
    )
    parser.add_argument(
        "-v",
        "--verbose",
        action="store_true",
        help="Show warnings for unreadable or non-media files",
    )

    args = parser.parse_args()

    input_paths = [Path(p).expanduser() for p in args.paths]

    custom_exts: set[str] | None = None
    if args.extensions:
        custom_exts = set()
        for ext in args.extensions:
            for item in ext.split(","):
                cleaned = item.strip().lower()
                if not cleaned:
                    continue
                if not cleaned.startswith("."):
                    cleaned = "." + cleaned
                custom_exts.add(cleaned)

    ffprobe_bin = get_ffprobe_path()

    candidates = collect_candidate_files(
        targets=input_paths,
        flat=args.flat,
        custom_extensions=custom_exts,
        all_files=args.all,
        verbose=args.verbose,
    )

    if not candidates:
        if args.json:
            print(
                json.dumps(
                    {
                        "total_duration_seconds": 0.0,
                        "total_duration_clock": "00:00:00",
                        "total_duration_human": "0s",
                        "total_files": 0,
                        "files": [],
                        "targets": [],
                    },
                    indent=2,
                )
            )
        else:
            print("No media files found.")
        sys.exit(0)

    num_workers = args.threads or min(32, max(4, (os.cpu_count() or 4) * 4))

    media_files: list[MediaFile] = []

    def probe_worker(item: tuple[Path, Path]) -> MediaFile | None:
        p, target = item
        dur = probe_duration(ffprobe_bin, p, verbose=args.verbose)
        if dur is not None and dur > 0:
            return MediaFile(path=p, duration=dur, target=target)
        if p.is_file() and p in input_paths and args.verbose:
            sys.stderr.write(
                f"Warning: '{p}' is not a valid media file or has no duration.\n"
            )
        return None

    with concurrent.futures.ThreadPoolExecutor(max_workers=num_workers) as executor:
        results = executor.map(probe_worker, candidates)
        for mf in results:
            if mf is not None:
                media_files.append(mf)

    # Sort files
    if args.sort == "path":
        media_files.sort(key=lambda m: str(m.path), reverse=args.reverse)
    elif args.sort == "name":
        media_files.sort(key=lambda m: m.path.name.lower(), reverse=args.reverse)
    elif args.sort == "duration":
        media_files.sort(key=lambda m: m.duration, reverse=args.reverse)

    total_duration = sum(m.duration for m in media_files)
    total_count = len(media_files)

    # Breakdown per target argument
    target_stats: dict[Path, dict[str, float | int]] = {}
    for mf in media_files:
        if mf.target not in target_stats:
            target_stats[mf.target] = {"duration": 0.0, "count": 0}
        target_stats[mf.target]["duration"] += mf.duration
        target_stats[mf.target]["count"] += 1

    if args.json:
        out = {
            "total_duration_seconds": round(total_duration, 3),
            "total_duration_clock": format_clock(total_duration, show_ms=True),
            "total_duration_human": format_human(total_duration),
            "total_files": total_count,
            "targets": [
                {
                    "target": format_display_path(t),
                    "duration_seconds": round(s["duration"], 3),
                    "duration_clock": format_clock(s["duration"]),
                    "duration_human": format_human(s["duration"]),
                    "files_count": s["count"],
                }
                for t, s in target_stats.items()
            ],
            "files": [
                {
                    "path": format_display_path(mf.path),
                    "duration_seconds": round(mf.duration, 3),
                    "duration_clock": format_clock(mf.duration),
                    "duration_human": format_human(mf.duration),
                }
                for mf in media_files
            ],
        }
        print(json.dumps(out, indent=2))
        return

    # If exactly 1 file was probed directly and no summary requested
    if (
        len(input_paths) == 1
        and input_paths[0].is_file()
        and not args.summary
        and total_count == 1
    ):
        mf = media_files[0]
        clock = format_clock(mf.duration)
        human = format_human(mf.duration)
        disp_path = format_display_path(mf.path)
        print(f"{disp_path}: {clock} ({human})")
        return

    term_width = shutil.get_terminal_size((80, 24)).columns
    term_width = max(60, min(term_width, 120))

    if not args.summary and media_files:
        col_dur = 14
        col_path = max(30, term_width - col_dur - 2)
        print(f"{'Path':<{col_path}}  {'Duration':>{col_dur}}")
        print("-" * term_width)
        for mf in media_files:
            dur_str = format_clock(mf.duration)
            p_str = format_display_path(mf.path)
            if len(p_str) > col_path:
                half = (col_path - 3) // 2
                p_display = p_str[:half] + "..." + p_str[-half:]
            else:
                p_display = p_str
            print(f"{p_display:<{col_path}}  {dur_str:>{col_dur}}")
        print("-" * term_width)

    # Multi-target breakdown if multiple targets specified
    if len(target_stats) > 1:
        print("Breakdown by target:")
        for t, s in target_stats.items():
            dur_str = format_clock(s["duration"])
            disp_target = format_display_path(t)
            count_str = f"({s['count']} {'file' if s['count'] == 1 else 'files'})"
            print(f"  {disp_target:<35}  {dur_str} {count_str}")
        print("-" * term_width)

    total_clock = format_clock(total_duration)
    total_human = format_human(total_duration)
    file_word = "file" if total_count == 1 else "files"
    print(f"Total Duration: {total_clock} ({total_human})")
    print(f"Files Analyzed: {total_count} {file_word}")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.stderr.write("\nInterrupted\n")
        sys.exit(130)
