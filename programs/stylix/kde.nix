{ config, ... }:
{
  xdg.configFile."kdeglobals".text = ''
    [Icons]
    Theme=${config.stylix.icons.dark}
  '';
}
