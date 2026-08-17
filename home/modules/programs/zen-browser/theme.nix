{ config, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  programs.zen-browser.profiles.default.userChrome = ''
    :root:root {
      --zen-colors-primary: ${colors.base01} !important;
      --zen-colors-secondary: ${colors.base01} !important;
      --zen-colors-tertiary: ${colors.base00} !important;
      --toolbar-bgcolor: ${colors.base01} !important;
      --toolbar-field-background: ${colors.base01} !important;
      --toolbar-field-focus-background: ${colors.base01} !important;
      --urlbar-box-background: ${colors.base01} !important;
    }

    #urlbar .urlbar-background,
    #urlbar-background,
    #urlbar-input-container,
    .urlbar-background,
    #urlbar[focused] > .urlbar-background,
    #urlbar[focused] > #urlbar-background,
    #urlbar:not([focused]) > .urlbar-background,
    #urlbar:not([focused]) > #urlbar-background {
      background-color: ${colors.base01} !important;
    }

    .urlbarView {
      background-color: ${colors.base01} !important;
    }
  '';
}
