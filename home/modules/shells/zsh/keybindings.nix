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
      autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey '^P' up-line-or-beginning-search
      bindkey '^[[A' up-line-or-beginning-search
      bindkey '^[OA' up-line-or-beginning-search
      bindkey '^N' down-line-or-beginning-search
      bindkey '^[[B' down-line-or-beginning-search
      bindkey '^[OB' down-line-or-beginning-search
      bindkey '^W' vi-backward-kill-word
      bindkey '^[b' vi-backward-word
      bindkey '^[f' vi-forward-word

      bindkey -s '^Xr' 'nix run "nixpkgs#"\C-b'
      bindkey -s '^Xs' 'nix shell "nixpkgs#"\C-b'
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
