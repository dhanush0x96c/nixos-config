_:

{
  programs.imv = {
    enable = true;
    settings = {
      options = {
        background = "000000";
        scaling_mode = "full";
        upscaling_method = "linear";
        loop_input = true;
        overlay_font = "JetBrains Mono:14";
        suppress_default_binds = false;
      };
      aliases = {
        x = "close";
      };
      binds = {
        # Navigation
        "<bracketleft>" = "prev";
        "<bracketright>" = "next";
        "gg" = "goto 1";
        "<Shift+G>" = "goto -1";

        # Panning
        "j" = "pan 0 -50";
        "k" = "pan 0 50";
        "h" = "pan 50 0";
        "l" = "pan -50 0";

        # Zooming
        "<Up>" = "zoom 1";
        "<Down>" = "zoom -1";
        "i" = "zoom 1";
        "o" = "zoom -1";
        "<Shift+plus>" = "zoom 1";
        "<minus>" = "zoom -1";

        # Rotation & Flipping
        "<Ctrl+r>" = "rotate by 90";
        "<Shift+R>" = "rotate by 270";
        "<Shift+H>" = "flip horizontal";
        "<Shift+V>" = "flip vertical";

        # Clipboard integration (copy file path or copy image data via wl-clipboard)
        "y" = "exec echo -n \"$imv_current_file\" | wl-copy";
        "<Shift+Y>" = "exec wl-copy < \"$imv_current_file\"";

        # Display controls
        "f" = "fullscreen";
        "d" = "overlay";
        "c" = "center";
        "s" = "scaling next";
        "<Shift+S>" = "upscaling next";
        "a" = "zoom actual";
        "r" = "reset";
        "x" = "close";

        # Animation playback
        "<period>" = "next_frame";
        "<space>" = "toggle_playing";

        # Slideshow
        "t" = "slideshow +1";
        "<Shift+T>" = "slideshow -1";
      };
    };
  };
}
