{ lib, ... }:

{
  programs.zsh = {
    fastSyntaxHighlighting.enable = true;

    initContent = lib.mkAfter ''
      FAST_HIGHLIGHT_STYLES[global-alias]='fg=blue,bold'
    '';
  };
}
