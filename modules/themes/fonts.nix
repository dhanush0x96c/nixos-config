{ pkgs, ... }:

{
  stylix.fonts = {
    sansSerif = {
      package = pkgs.inter;
      name = "Inter";
    };

    serif = {
      package = pkgs.inter;
      name = "Inter";
    };

    monospace = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };
}
