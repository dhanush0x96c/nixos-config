{ config, osConfig, ... }:

let
  c = config.lib.stylix.colors;
  fullName = osConfig.users.users.${config.home.username}.description;
in
{
  stylix.targets.hyprlock.enable = false;

  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
          color = "rgb(${c.base00})";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "rgb(${c.base07})";
          font_size = 90;
          font_family = config.stylix.fonts.monospace.name;
          position = "0, 120";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:43200000] date +"%A, %d %B %Y"'';
          color = "rgb(${c.base07})";
          font_size = 25;
          font_family = config.stylix.fonts.monospace.name;
          position = "0, 40";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(${c.base0D})";
          inner_color = "rgb(${c.base01})";
          font_color = "rgb(${c.base07})";
          fade_on_empty = false;
          placeholder_text = ''<span foreground="##${c.base05}"><i>󰌾 Logged in as </i><span foreground="##${c.base0D}">${fullName}</span></span>'';
          hide_input = false;
          check_color = "rgb(${c.base0D})";
          fail_color = "rgb(${c.base08})";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(${c.base0A})";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
