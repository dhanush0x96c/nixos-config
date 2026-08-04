{ pkgs, ... }:

{
  imports = [
    ./cursor.nix
    ./fonts.nix
    ./icons.nix
    ./kde-icons.nix
  ];

  stylix = {
    enable = true;
    image = ../../assets/wallpapers/gargantua.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-moon.yaml";
    polarity = "dark";
  };
}
