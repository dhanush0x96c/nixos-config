{ ... }:

{
  imports = [
    ./programs/kitty
    ./programs/yazi
    ./programs/git
    ./programs/bat
    ./programs/wofi
    ./programs/tmux
    ./programs/waybar
    ./programs/eza
    ./programs/fzf
    ./programs/zoxide
    ./programs/zsh
    ./programs/mako
    ./programs/neovim
    ./programs/zed
    ./programs/vscode
    ./programs/mpv
    ./programs/hyprland
    ./programs/rebuild
    ./programs/stylix/kde.nix
    ./programs/packages.nix
    ./programs/firefox
    ./programs/zen-browser
    ./programs/clipboard
    ./programs/bluetooth/home.nix
    ./programs/podman/home.nix
    ./programs/btop
    ./programs/fd
    ./programs/jq
    ./programs/ripgrep
  ];
  home = {

    username = "dhanush";
    homeDirectory = "/home/dhanush";

    stateVersion = "26.05";

    # TODO: This was a temporary fix to remove the warning
    pointerCursor.enable = true;

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
}
