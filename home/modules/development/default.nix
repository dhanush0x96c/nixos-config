{ pkgs, ... }:

{
  imports = [
    ./agents
    ./editors
    ./languages
  ];

  home.packages = with pkgs; [
    ffmpeg
  ];
}
