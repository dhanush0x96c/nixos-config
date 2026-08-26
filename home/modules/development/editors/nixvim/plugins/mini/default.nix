{ ... }:

{
  plugins.mini.enable = true;

  imports = [
    ./ai.nix
    ./icons.nix
    ./pairs.nix
    ./surround.nix
  ];
}
