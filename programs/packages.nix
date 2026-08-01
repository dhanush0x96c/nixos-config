{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Essentials
    bluez
    bluez-tools
    bluetui
    networkmanagerapplet
    libnotify

    # Browsers
    firefox
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # CLI Tools
    btop
    duf
    dust
    fd
    fx
    jq
    moor
    nixfmt
    ripgrep
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
