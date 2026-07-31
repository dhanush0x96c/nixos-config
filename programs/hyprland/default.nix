{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    kitty
    mako
    playerctl
    waybar
    wireplumber
    wl-clipboard
    wofi
    yazi
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
