{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Essentials
    mako
    wl-clipboard
    brightnessctl
    hyprpaper
    hyprlock
    hypridle
    hyprpicker
    hyprshot
    mpv
    playerctl
    bluez
    bluez-tools
    bluetui
    networkmanagerapplet

    # Browsers
    firefox
    google-chrome
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
    vscode
    zed-editor

    # DevTools
    ffmpeg
    go
    python3
    uv
  ];
}
