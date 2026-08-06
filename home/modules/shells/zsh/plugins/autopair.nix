{ pkgs, ... }:

{
  programs.zsh.plugins = [
    {
      name = "zsh-autopair";
      src = "${pkgs.zsh-autopair}/share/zsh/zsh-autopair";
      file = "autopair.zsh";
    }
  ];
}
