_:

{
  programs.zellij.settings.keybinds = {
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
}
