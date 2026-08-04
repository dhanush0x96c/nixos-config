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

    # programs
    ../modules/programs/firefox.nix
    ../modules/programs/mpv.nix
    ../modules/programs/rclone.nix
    ../modules/programs/zen-browser.nix
  ];
}
