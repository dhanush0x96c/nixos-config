{ pkgs, ... }:

{
  programs.zsh = {
    shellAliases = {
      cat = "${pkgs.bat}/bin/bat";
      la = "ls -lAh";
      md = "mkdir -p";
      mcd = ''f(){ mkdir -p -- "$1" && cd -- "$1"; }; f'';
      tree = "ls --tree --git-ignore";
    };

    shellGlobalAliases = {
      G = "| ${pkgs.ripgrep}/bin/rg";
      Y = "| ${pkgs.wl-clipboard}/bin/wl-copy";
      P = "${pkgs.wl-clipboard}/bin/wl-paste >";
      N = "> /dev/null 2>&1";
      NE = "2> /dev/null";
      NO = "> /dev/null";
    };
  };
}
