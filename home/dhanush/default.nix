{ ... }:

{
  imports = [
    ../modules/shells
    ../modules/cli
    ../modules/editors
    ../modules/hyprland
    ../modules/terminal
    ../modules/system
    ../modules/themes
    ../modules/vcs

    # programs
    ../modules/programs/firefox
    ../modules/programs/mpv
    ../modules/programs/packages.nix
    ../modules/programs/zen-browser
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
