{ pkgs, ... }:

{
  programs.cargo = {
    enable = true;
  };

  home.packages = with pkgs; [
    clippy
    rust-analyzer
    rustc
    rustfmt
  ];
}
