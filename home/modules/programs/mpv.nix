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

      # Volume
      "UP" = "add volume 5";
      "DOWN" = "add volume -5";
      "m" = "cycle mute";

      # Display and Subtitles
      "f" = "cycle fullscreen";
      "c" = "cycle sub-visibility";
      "i" = "cycle ontop";

      # Playback Speed
      "<" = "add speed -0.25";
      ">" = "add speed 0.25";
      "Shift+," = "add speed -0.25";
      "Shift+." = "add speed 0.25";

      # Frame Stepping
      "." = "frame-step";
      "," = "frame-back-step";

      # Playlist Navigation
      "Shift+n" = "playlist-next";
      "Shift+p" = "playlist-prev";
      "N" = "playlist-next";
      "P" = "playlist-prev";

      # Percentage-based Seeking
      "0" = "seek 0 absolute-percent";
      "1" = "seek 10 absolute-percent";
      "2" = "seek 20 absolute-percent";
      "3" = "seek 30 absolute-percent";
      "4" = "seek 40 absolute-percent";
      "5" = "seek 50 absolute-percent";
      "6" = "seek 60 absolute-percent";
      "7" = "seek 70 absolute-percent";
      "8" = "seek 80 absolute-percent";
      "9" = "seek 90 absolute-percent";
      "HOME" = "seek 0 absolute-percent";
      "END" = "seek 100 absolute-percent";
    };
  };
}
