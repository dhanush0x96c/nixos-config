{ ... }:

{
  imports = [
    ../../modules/bluetooth.nix
    ../../modules/boot.nix
    ../../modules/compatibility.nix
    ../../modules/fuse.nix
    ../../modules/hyprland.nix
    ../../modules/kanata
    ../../modules/keyboard.nix
    ../../modules/locale.nix
    ../../modules/networking.nix
    ../../modules/nix.nix
    ../../modules/podman.nix
    ../../modules/sddm.nix
    ../../modules/security.nix
    ../../modules/themes
    ../../modules/users.nix
  ];

  system.stateVersion = "26.05";
}
