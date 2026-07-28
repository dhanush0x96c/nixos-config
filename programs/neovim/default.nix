{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gcc
      tree-sitter
    ];
  };

  xdg.configFile."nvim".source = ./nvim;
}
