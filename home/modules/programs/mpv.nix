{ pkgs, ... }:

{
  stylix.targets.mpv.enable = false;

  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.mpris ];
  };
}
