{ pkgs, ... }:

{
  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
