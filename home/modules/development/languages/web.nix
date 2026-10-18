{ pkgs, ... }:

{
  programs.bun = {
    enable = true;
  };

  programs.npm = {
    enable = true;
  };

  home.packages = with pkgs; [
    typescript
  ];
}
