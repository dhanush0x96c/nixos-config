{ ... }:
{
  stylix.targets.mako.enable = false;
  services.mako = {
    enable = true;
    extraConfig = builtins.readFile ./config;
  };
}
