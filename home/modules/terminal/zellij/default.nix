_:

{
  imports = [
    ./scripts.nix
    ./settings.nix
    ./keybindings.nix
    ./layouts.nix
  ];

  programs.zellij.enable = true;
}
