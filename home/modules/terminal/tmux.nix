{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    escapeTime = 0;
    historyLimit = 50000;
    terminal = "screen-256color";
    aggressiveResize = true;
    mouse = true;
    prefix = "C-Space";
    baseIndex = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    resizeAmount = 10;

    plugins = with pkgs.tmuxPlugins; [
      yank
      # vim-tmux-navigator
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_theme moon
          set -g @tokyo-night-tmux_transparent 1

          set -g @tokyo-night-tmux_show_datetime 0
          set -g @tokyo-night-tmux_show_git 1
          set -g @tokyo-night-tmux_window_id_style none
        '';
      }
    ];

    extraConfig = ''
      # Sensible options  
      set -g display-time 4000
      set -g status-interval 5
      set -g focus-events on
      set -as terminal-features ",*:RGB"
      set -as terminal-features ",*:hyperlinks"
      set -g status-position top
      set -g renumber-windows on

      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      bind -n S-Left  previous-window
      bind -n S-Right next-window

      bind -n M-v copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind r run-shell "
        tmux source-file ${config.xdg.configHome}/tmux/tmux.conf
        tmux display-message 'Reloaded!'
      "
    '';
  };
}
