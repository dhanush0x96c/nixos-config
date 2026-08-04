{ ... }:

{
  imports = [
    ./home.nix

    ../modules/shells
    ../modules/cli
    ../modules/compatibility.nix
    ../modules/development
    ../modules/hyprland
    ../modules/terminal
    ../modules/system
    ../modules/vcs
    ../modules/programs
  ];
}
