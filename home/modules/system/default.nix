{ pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./btop.nix
    ./clipboard.nix
    ./network-manager-applet.nix
    ./podman.nix
    ./rebuild
    ./yazi.nix
  ];

  home.packages = with pkgs; [
    libnotify
    sshfs
  ];
}
