{ pkgs, ... }:

{
  programs.zsh = {
    plugins = [
      {
        name = "git";
        src = "${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/git";
      }
    ];
  };
}
