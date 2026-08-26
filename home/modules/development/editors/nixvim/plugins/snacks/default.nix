{ ... }:

{
  plugins.snacks.enable = true;

  imports = [
    ./bigfile.nix
    ./bufdelete.nix
    ./dashboard.nix
    ./explorer.nix
    ./git.nix
    ./indent.nix
    ./input.nix
    ./notifier.nix
    ./picker.nix
    ./scratch.nix
    ./scroll.nix
    ./statuscolumn.nix
  ];
}
