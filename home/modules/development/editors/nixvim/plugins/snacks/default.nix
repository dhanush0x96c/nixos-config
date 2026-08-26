{ ... }:

{
  plugins.snacks.enable = true;

  imports = [
    ./bigfile.nix
    ./bufdelete.nix
    ./dashboard.nix
    ./explorer.nix
    ./input.nix
    ./notifier.nix
    ./picker.nix
  ];
}
