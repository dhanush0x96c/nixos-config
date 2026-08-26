{ ... }:

{
  plugins.snacks.enable = true;

  imports = [
    ./bigfile.nix
    ./bufdelete.nix
    ./dashboard.nix
    ./explorer.nix
    ./notifier.nix
    ./picker.nix
  ];
}
