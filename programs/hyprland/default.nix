{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;
    systemd.enable = false;
  };

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;
}
