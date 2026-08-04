{ ... }:

{
  imports = [
    ../modules/shells
    ../modules/cli
    ../modules/development
    ../modules/hyprland
    ../modules/terminal
    ../modules/system
    ../modules/themes
    ../modules/vcs

    # programs
    ../modules/programs/firefox.nix
    ../modules/programs/mpv.nix
    ../modules/programs/rclone.nix
    ../modules/programs/zen-browser.nix
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
