{ pkgs, inputs, ... }:

{
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
    ./mako.nix
    ./waybar
    ./wofi
  ];

  home.packages = with pkgs; [
    brightnessctl
    hyprpaper
    hyprpicker
    hyprshot
    kitty
    mako
    playerctl
    inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.default
    wireplumber
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
