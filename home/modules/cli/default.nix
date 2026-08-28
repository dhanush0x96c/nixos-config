{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./carapace.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gpg.nix
    ./jq.nix
    ./pass.nix
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
