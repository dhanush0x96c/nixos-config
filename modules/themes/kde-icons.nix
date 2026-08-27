{ config, ... }:

{
  home-manager.users.dhanush = {
    xdg.configFile."kdeglobals".text = ''
      [Icons]
      Theme=${config.stylix.icons.dark}
    '';
  };
}
