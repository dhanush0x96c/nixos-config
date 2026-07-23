{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [

    neovim
    tree-sitter
    mako
    wl-clipboard
    brightnessctl
    firefox
    hyprpaper
    hyprlock
    hypridle
    hyprpicker
    hyprshot
    fzf
    eza
    zoxide
    mpv
    playerctl
    nixfmt
    sshfs
    dust
    duf
    btop
    tldr
    moor
    ripgrep
    fd
    unzip
    cargo
    statix
    zed-editor
    vscode
    antigravity-cli
    codex
    github-copilot-cli
    opencode

    stow
    python3
    clang
    google-chrome

    bluez
    bluez-tools
    bluetui
    networkmanagerapplet

    uv
    ffmpeg

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
