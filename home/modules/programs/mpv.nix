{ pkgs, ... }:

{
  stylix.targets.mpv.enable = false;

  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.mpris ];
    bindings = {
      # Playback and Navigation
      "SPACE" = "cycle pause";
      "k" = "cycle pause";
      "j" = "seek -10";
      "l" = "seek 10";
      "LEFT" = "seek -5";
      "RIGHT" = "seek 5";

      # Frame Stepping
      "." = "frame-step";
      "," = "frame-back-step";

      # Playback Speed
      "<" = "add speed -0.25";
      ">" = "add speed 0.25";
      "[" = "ignore";
      "]" = "ignore";

      # Volume and Audio
      "UP" = "add volume 5";
      "DOWN" = "add volume -5";
      "m" = "cycle mute";

      # Subtitles and Closed Captions
      "c" = "cycle sub-visibility";
      "+" = "add sub-scale +0.1";
      "=" = "add sub-scale +0.1";
      "-" = "add sub-scale -0.1";

      # Playlist Navigation
      "Shift+n" = "playlist-next";
      "Shift+p" = "playlist-prev";
      "N" = "playlist-next";
      "P" = "playlist-prev";

      # Keyboard Shortcuts Cheatsheet
      "?" = "script-binding stats/display-page-4-toggle";
    };
  };
}
