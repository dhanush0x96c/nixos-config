{ pkgs, ... }:

{
  programs.zsh = {
    initContent = ''
      bindkey ' ' magic-space
      bindkey '^[[3~' delete-char
      bindkey '^[[H' beginning-of-line
      bindkey '^[[1~' beginning-of-line
      bindkey '^[OH' beginning-of-line
      bindkey '^[[F' end-of-line
      bindkey '^[[4~' end-of-line
      bindkey '^[OF' end-of-line
      bindkey '^P' history-search-backward
      bindkey '^[[A' history-search-backward
      bindkey '^[OA' history-search-backward
      bindkey '^N' history-search-forward
      bindkey '^[[B' history-search-forward
      bindkey '^[OB' history-search-forward
      bindkey '^W' vi-backward-kill-word
      bindkey '^[b' vi-backward-word
      bindkey '^[f' vi-forward-word

      bindkey -s '^Xr' 'nix run "nixpkgs#"\C-b'
      bindkey -s '^Xgc' 'git commit -m ""\C-b'

      copy-buffer() {
        print -rn -- "$BUFFER" | ${pkgs.wl-clipboard}/bin/wl-copy
        zle -M "Command copied to clipboard"
      }
      zle -N copy-buffer
      bindkey '^Xc' copy-buffer

      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey '^X^E' edit-command-line
    '';
  };
}
