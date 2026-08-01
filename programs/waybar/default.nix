{
  config,
  inputs,
  pkgs,
  ...
}:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    package = inputs.waybar.packages.${pkgs.system}.default;
    enable = true;
  };
  xdg = {
    configFile = {
      "waybar/config".source = ./config;
      "waybar/style.css".source = ./style.css;
      "waybar/rebuild-status.sh" = {
        source = ./rebuild-status.sh;
        executable = true;
      };
      "waybar/rebuild.sh" = {
        source = ./rebuild.sh;
        executable = true;
      };
      "waybar/colors.css".text = ''
        @define-color base   ${colors.base00};
        @define-color mantle ${colors.base01};
        @define-color crust  ${colors.base01};

        @define-color text     ${colors.base05};
        @define-color subtext0 ${colors.base04};
        @define-color subtext1 ${colors.base05};

        @define-color surface0 ${colors.base02};
        @define-color surface1 ${colors.base02};
        @define-color surface2 ${colors.base03};

        @define-color overlay0 ${colors.base03};
        @define-color overlay1 ${colors.base04};
        @define-color overlay2 ${colors.base04};

        @define-color blue      ${colors.base0D};
        @define-color lavender  ${colors.base0E};
        @define-color sapphire  ${colors.base0D};
        @define-color sky       ${colors.base0C};
        @define-color teal      ${colors.base0C};
        @define-color green     ${colors.base0B};
        @define-color yellow    ${colors.base0A};
        @define-color peach     ${colors.base09};
        @define-color maroon    ${colors.base08};
        @define-color red       ${colors.base08};
        @define-color mauve     ${colors.base0E};
        @define-color pink      ${colors.base0F};
        @define-color flamingo  ${colors.base0F};
        @define-color rosewater ${colors.base06};

        @define-color base00 ${colors.base00};
        @define-color base01 ${colors.base01};
        @define-color base02 ${colors.base02};
        @define-color base03 ${colors.base03};
        @define-color base04 ${colors.base04};
        @define-color base05 ${colors.base05};
        @define-color base06 ${colors.base06};
        @define-color base07 ${colors.base07};
        @define-color base08 ${colors.base08};
        @define-color base09 ${colors.base09};
        @define-color base0A ${colors.base0A};
        @define-color base0B ${colors.base0B};
        @define-color base0C ${colors.base0C};
        @define-color base0D ${colors.base0D};
        @define-color base0E ${colors.base0E};
        @define-color base0F ${colors.base0F};
      '';
    };
  };
}
