{ ... }:

{
  stylix.targets.kitty.opacity.enable = false;

  programs.kitty = {
    enable = true;

    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = 16;

      background_opacity = "0.8";
    };

    extraConfig = ''
      mouse_map ctrl+left click grabbed,ungrabbed mouse_handle_click selection link prompt
    '';
  };
}
