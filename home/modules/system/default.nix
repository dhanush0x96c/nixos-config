{ pkgs, ... }:

{
  imports = [
    ./bluetooth
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
