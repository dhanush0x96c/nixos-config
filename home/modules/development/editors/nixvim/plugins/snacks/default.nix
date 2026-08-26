{ ... }:

{
  plugins.snacks.enable = true;

  imports = [
    ./bufdelete.nix
    ./dashboard.nix
    ./explorer.nix
    ./notifier.nix
    ./picker.nix
  ];
}
