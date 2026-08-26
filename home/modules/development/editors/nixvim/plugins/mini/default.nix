{ ... }:

{
  plugins.mini.enable = true;

  imports = [
    ./ai.nix
    ./files.nix
    ./icons.nix
    ./pairs.nix
    ./surround.nix
  ];
}
