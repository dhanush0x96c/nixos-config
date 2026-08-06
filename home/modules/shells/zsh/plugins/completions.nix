{ pkgs, ... }:

{
  home.packages = [
    pkgs.zsh-completions
  ];

  programs.zsh = {
    enableCompletion = true;

    initContent = ''
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
    '';
  };
}
