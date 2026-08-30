{ config, lib, ... }:

{
  imports = [
    ./ghostty.nix
    ./herdr.nix
    ./kitty.nix
    ./tmux.nix
  ];

  options.my.terminal = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "kitty";
      description = "Executable name of the preferred terminal emulator.";
    };
    desktop = lib.mkOption {
      type = lib.types.str;
      default = "kitty.desktop";
      description = "Desktop file name of the preferred terminal emulator.";
    };
  };

  config = {
    xdg.terminal-exec = {
      enable = true;
      settings = {
        default = [ config.my.terminal.desktop ];
      };
    };
  };
}
