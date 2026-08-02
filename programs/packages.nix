{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Essentials
    networkmanagerapplet
    libnotify

    # Browsers
    firefox
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # CLI Tools
    duf
    dust
    fx
    moor
    nixfmt
    sshfs
    tldr
    unzip

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
