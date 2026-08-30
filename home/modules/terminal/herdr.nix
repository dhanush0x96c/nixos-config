{ ... }:

{
  programs.herdr = {
    enable = true;

    settings = {
      onboarding = false;

      terminal = {
        new_cwd = "follow";
      };

      theme = {
        name = "tokyo-night";
      };

      ui = {
        tab_bar_position = "top";
        mouse_capture = true;
      };

      keys = {
        prefix = "ctrl+space";

        # Navigation (tmux M-Arrows and vi keys)
        focus_pane_left = [
          "prefix+h"
          "alt+left"
        ];
        focus_pane_down = [
          "prefix+j"
          "alt+down"
        ];
        focus_pane_up = [
          "prefix+k"
          "alt+up"
        ];
        focus_pane_right = [
          "prefix+l"
          "alt+right"
        ];

        # Tabs / Windows (tmux S-Left/Right and prefix+p/n)
        previous_tab = [
          "prefix+p"
          "shift+left"
        ];
        next_tab = [
          "prefix+n"
          "shift+right"
        ];

        # Splits (tmux % and " along with Herdr defaults)
        split_vertical = [
          "prefix+v"
          "prefix+%"
        ];
        split_horizontal = [
          "prefix+minus"
          "prefix+\""
        ];

        # Copy mode (tmux M-v and prefix+[)
        copy_mode = [
          "prefix+["
          "alt+v"
        ];

        # Reload config (tmux prefix+r and prefix+shift+r)
        reload_config = [
          "prefix+shift+r"
          "prefix+r"
        ];

        # Pane / Tab management
        new_tab = "prefix+c";
        close_pane = "prefix+x";
        zoom = "prefix+z";
        switch_tab = "prefix+1..9";
      };
    };
  };
}
