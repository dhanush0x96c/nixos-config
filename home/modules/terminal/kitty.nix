{ pkgs, ... }:

{
  stylix.targets.kitty = {
    opacity.enable = false;
    fonts.enable = false;
  };

  programs.kitty = {
    enable = true;

    shellIntegration.mode = "no-cursor";
    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 16;
    };

    settings = {
      background_opacity = "0.8";
    };

    extraConfig = ''
      mouse_map ctrl+left click grabbed,ungrabbed mouse_handle_click selection link prompt
    '';
  };
}
