_:

{
  stylix.targets.ghostty = {
    opacity.enable = false;
    fonts.enable = false;
  };

  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 16;
      background-opacity = 0.8;
      shell-integration-features = "no-cursor";
    };
  };
}
