{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
    ./settings.nix
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  stylix.targets.zen-browser.profileNames = [ "default" ];
}
