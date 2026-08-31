{ pkgs, ... }:

{
  imports = [
    ./agents
    ./editors
    ./gcc.nix
    ./go.nix
    ./uv.nix
  ];

  home.packages = with pkgs; [
    ffmpeg
    python3
  ];
}
