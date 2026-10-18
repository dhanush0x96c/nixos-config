{ config, pkgs, ... }:

{
  programs.cargo = {
    enable = true;
    cargoHome = "${config.xdg.dataHome}/cargo";
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/cargo/bin"
  ];

  home.packages = with pkgs; [
    clippy
    rust-analyzer
    rustc
    rustfmt
  ];
}
