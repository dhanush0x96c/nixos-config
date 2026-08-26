{ ... }:

{
  plugins.snacks.enable = true;

  imports = [
    ./bufdelete.nix
    ./dashboard.nix
    ./notifier.nix
    ./picker.nix
  ];
}
