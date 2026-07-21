{ ... }:
{
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;
  };
  xdg = {
    configFile = {
      "waybar/config".source = ./waybar/config;
      "waybar/style.css".source = ./waybar/style.css;
      "waybar/mocha.css".source = ./waybar/mocha.css;
    };
  };
}
