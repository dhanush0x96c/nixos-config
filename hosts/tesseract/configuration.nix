{ ... }:

{
  imports = [
    ../../programs/kanata
    ../../programs/stylix
    ../../programs/bluetooth
    ../../programs/podman

    ../../modules/boot.nix
    ../../modules/networking.nix
    ../../modules/users.nix
    ../../modules/hyprland.nix
    ../../modules/sddm.nix
    ../../modules/security.nix
    ../../modules/locale.nix
    ../../modules/keyboard.nix
    ../../modules/nix.nix
    ../../modules/fuse.nix
  ];

  system.stateVersion = "26.05";
}
