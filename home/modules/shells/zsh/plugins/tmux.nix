{ pkgs, lib, ... }:

{
  programs.zsh = {
    plugins = [
      {
        name = "tmux";
        src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/tmux";
      }
    ];

    initContent = lib.mkBefore ''
      if [[ "$TERM" == "xterm-kitty" ]]; then
        ZSH_TMUX_AUTOSTART=true
        ZSH_TMUX_AUTOCONNECT=false
      fi
    '';
  };
}
