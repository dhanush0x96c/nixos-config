{ ... }:

{
  plugins.snacks.enable = true;

  imports = [
    ./dashboard.nix
    ./picker.nix
  ];
}
