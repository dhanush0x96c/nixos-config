{ ... }:

{
  imports = [
    ./settings.nix
    ./aliases.nix
    ./keybindings.nix
    ./plugins
  ];

  programs.zsh.enable = true;
}
