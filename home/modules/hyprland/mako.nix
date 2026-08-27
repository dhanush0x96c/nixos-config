{ config, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  stylix.targets.mako.enable = false;
  services.mako = {
    enable = true;
    settings = {
      # Colors
      background-color = colors.base00;
      text-color = colors.base05;
      border-color = colors.base0D;
      progress-color = colors.base02;

      # Basic Configuration
      font = "monospace 10";
      width = 300;
      height = 100;
      margin = 10;
      padding = 15;
      border-size = 2;
      border-radius = 5;
      default-timeout = 5000;
      ignore-timeout = 0;
      max-visible = 5;
      sort = "-time";

      # Alignment
      layer = "overlay";
      anchor = "top-right";

      # Format
      format = "<b>%s</b>\\n%b";
      text-alignment = "left";
      icon-path = "${config.stylix.icons.package}/share/icons/${config.stylix.icons.dark}";
      max-icon-size = 64;
      markup = 1;
      actions = 1;

      # Mouse Controls
      on-button-left = "dismiss";
      on-button-middle = "dismiss-all";
      on-button-right = "dismiss";
      on-touch = "dismiss";

      # Urgency Levels
      "urgency=low" = {
        border-color = colors.base0B;
        default-timeout = 3000;
      };

      "urgency=normal" = {
        border-color = colors.base0D;
        default-timeout = 5000;
      };

      "urgency=high" = {
        border-color = colors.base08;
        background-color = colors.base01;
        default-timeout = 10000;
      };
    };
  };
}
