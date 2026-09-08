{ pkgs, ... }:

let
  durationScript = ./duration.py;
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "duration" ''
      export PATH="${pkgs.ffmpeg}/bin:$PATH"
      export FFPROBE_PATH="${pkgs.ffmpeg}/bin/ffprobe"
      exec ${pkgs.python3}/bin/python3 ${durationScript} "$@"
    '')
  ];
}
