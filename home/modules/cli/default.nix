{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./jq.nix
    ./ripgrep.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    duf
    dust
    fx
    tldr
    unzip
  ];
}
