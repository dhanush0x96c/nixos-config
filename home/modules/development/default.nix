{ pkgs, ... }:

{
  imports = [
    ./agents
    ./editors
    ./go.nix
    ./uv.nix
  ];

  home.packages = with pkgs; [
    ffmpeg
    python3
  ];
}
