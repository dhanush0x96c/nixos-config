{ config, ... }:

let
  c = config.lib.stylix.colors.withHashtag;
  style = path: import path { inherit c; };
in
{
  programs.zen-browser.profiles.default.userContent = ''
    ${style ./global.nix}
  '';
}
