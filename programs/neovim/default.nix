{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # Core build & search tools
      gcc
      tree-sitter
      gnumake
      ripgrep
      fd

      # Language Servers (LSPs)
      nixd
      lua-language-server

      # Formatters & Linters
      nixfmt
      stylua
    ];
  };

  xdg.configFile."nvim".source = ./nvim;
}
