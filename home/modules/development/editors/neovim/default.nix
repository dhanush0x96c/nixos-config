{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # Core build & search tools
      gcc
      tree-sitter
      gnumake
      ripgrep
      fd

      # Language Servers (LSPs)
      nil
      lua-language-server

      # Formatters & Linters
      nixfmt
      statix
      stylua
    ];
  };

  xdg.configFile."nvim".source = ./nvim;
}
