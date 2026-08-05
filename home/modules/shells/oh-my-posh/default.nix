{
  pkgs,
  config,
  ...
}:

let
  c = config.lib.stylix.colors;
  toml = builtins.readFile ./oh-my-posh.toml;
  themedToml =
    builtins.replaceStrings
      [
        "@COLOR_FG@"
        "@COLOR_BLUE@"
        "@COLOR_GREEN@"
        "@COLOR_YELLOW@"
        "@COLOR_RED@"
      ]
      [
        c.base05
        c.base0D
        c.base0B
        c.base0A
        c.base08
      ]
      toml;
in
{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    configFile = pkgs.writeText "oh-my-posh.toml" themedToml;
  };
}
