{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Essentials
    networkmanagerapplet
    libnotify

    # CLI Tools
    duf
    dust
    fx
    moor
    nixfmt
    sshfs
    tldr
    unzip
    rclone

    # Editors/Agents
    antigravity-cli
    codex
    github-copilot-cli
    opencode

    # DevTools
    ffmpeg
    go
    python3
    uv
  ];
}
