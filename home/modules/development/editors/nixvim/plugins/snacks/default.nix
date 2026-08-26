{ ... }:

{
  plugins.snacks.enable = true;

  imports = [
    ./dashboard.nix
    ./notifier.nix
    ./picker.nix
  ];
}
