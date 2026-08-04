{ pkgs, config, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
  sddm-theme = pkgs.where-is-my-sddm-theme.override {
    themeConfig = {
      General = {
        passwordCharacter = "*";
        passwordMask = true;
        passwordInputWidth = 0.5;
        passwordInputBorderWidth = 0;
        passwordInputCursorVisible = false;
        passwordFontSize = 80;
        passwordAllowEmpty = false;
        cursorBlinkAnimation = true;
        showSessionsByDefault = false;
        sessionsFontSize = 24;
        showUsersByDefault = false;
        usersFontSize = 48;
        showUserRealNameByDefault = true;
        backgroundFillMode = "aspect";
        blurRadius = 0;
        hideCursor = true;
        font = config.stylix.fonts.monospace.name;
        helpFont = config.stylix.fonts.monospace.name;
        helpFontSize = 18;
        backgroundFill = colors.base00;
        basicTextColor = colors.base05;
        passwordCursorColor = colors.base05;
        passwordInputBackground = colors.base00;
        passwordTextColor = colors.base05;
        wrongPasswordBorderColor = colors.base08;
      };
    };
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where_is_my_sddm_theme";
    extraPackages = [ sddm-theme ];
  };

  environment.systemPackages = [ sddm-theme ];
}
