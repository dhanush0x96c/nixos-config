{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "zdev" ''
      AGENT_CMD="''${AGENT_CMD:-codex}"
      if [ "$#" -gt 0 ] && [[ ! "$1" == -* ]]; then
        AGENT_CMD="$1"
        shift
      fi
      export AGENT_CMD

      SESSION_NAME="zdev-$$"

      if [ -n "$ZELLIJ" ]; then
        zellij attach -b "$SESSION_NAME" options --default-layout dev
        zellij action switch-session "$SESSION_NAME"
      else
        zellij -s "$SESSION_NAME" options --default-layout dev
      fi
    '')
  ];
  programs.zellij = {
    enable = true;

    layouts = {
      dev = ''
        layout {
            default_tab_template {
                pane size=1 borderless=true {
                    plugin location="tab-bar"
                }
                children
                pane size=1 borderless=true {
                    plugin location="status-bar"
                }
            }
            tab name="Agent" {
                pane command="bash" {
                    args "-c" "exec ''${AGENT_CMD:-codex}"
                }
            }
            tab name="Editor" {
                pane command="nvim"
            }
            tab name="Shell"
        }
      '';
    };

    settings = {
      default_shell = "zsh";
      pane_frames = false;
      scroll_buffer_size = 50000;
      mouse_mode = true;
      copy_command = "wl-copy";
      show_startup_tips = false;

      default_mode = "locked";

      keybinds = {
        shared = {
          unbind = {
            _args = [ "Alt f" ];
          };
          bind = {
            _args = [ "Alt Shift f" ];
            ToggleFloatingPanes = { };
          };
        };
        locked = {
          unbind = {
            _args = [ "Ctrl g" ];
          };
          _children = [
            {
              bind = {
                _args = [ "Ctrl Shift l" ];
                SwitchToMode = {
                  _args = [ "Normal" ];
                };
              };
            }
            {
              bind = {
                _args = [
                  "Alt h"
                  "Alt Left"
                ];
                MoveFocusOrTab = {
                  _args = [ "Left" ];
                };
              };
            }
            {
              bind = {
                _args = [
                  "Alt j"
                  "Alt Down"
                ];
                MoveFocus = {
                  _args = [ "Down" ];
                };
              };
            }
            {
              bind = {
                _args = [
                  "Alt k"
                  "Alt Up"
                ];
                MoveFocus = {
                  _args = [ "Up" ];
                };
              };
            }
            {
              bind = {
                _args = [
                  "Alt l"
                  "Alt Right"
                ];
                MoveFocusOrTab = {
                  _args = [ "Right" ];
                };
              };
            }
          ];
        };
        "shared_except \"locked\"" = {
          unbind = {
            _args = [ "Ctrl g" ];
          };
          bind = {
            _args = [ "Ctrl Shift l" ];
            SwitchToMode = {
              _args = [ "Locked" ];
            };
          };
        };
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
