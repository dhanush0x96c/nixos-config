{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    mako
    playerctl
    waybar
    wl-clipboard
    wofi
    hyprshutdown
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;
    systemd.enable = false;
  };

  xdg.configFile."hypr/hyprland.lua".source = ./hypr/hyprland.lua;

  programs.hyprshot = {
    enable = true;
    saveLocation = "$HOME/Pictures/Screenshots";
  };
}
