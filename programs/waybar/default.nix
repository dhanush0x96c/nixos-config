{ ... }:
{
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;
  };
  xdg = {
    configFile = {
      "waybar/config".source = ./config;
      "waybar/style.css".source = ./style.css;
      "waybar/mocha.css".source = ./mocha.css;
    };
  };
}
