{ ... }:

{
  programs.zellij = {
    enable = true;

    settings = {
      default_shell = "zsh";
      pane_frames = false;
      scroll_buffer_size = 50000;
      mouse_mode = true;
      copy_command = "wl-copy";
      show_startup_tips = false;

      keybinds = {
        "shared_except \"tmux\" \"locked\"" = {
          unbind = {
            _args = [ "Ctrl b" ];
          };
          bind = {
            _args = [ "Ctrl Space" ];
            SwitchToMode = {
              _args = [ "Tmux" ];
            };
          };
        };
        tmux = {
          unbind = {
            _args = [ "Ctrl b" ];
          };
          bind = {
            _args = [ "Ctrl Space" ];
            Write = {
              _args = [ 0 ];
            };
            SwitchToMode = {
              _args = [ "Normal" ];
            };
          };
        };
      };
    };
  };
}
