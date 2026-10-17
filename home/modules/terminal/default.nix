{ config, ... }:

{
  imports = [
    ./ghostty.nix
    ./herdr.nix
    ./kitty.nix
    ./zellij
  ];

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ config.my.terminal.desktop ];
    };
  };
}
