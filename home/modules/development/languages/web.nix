{ config, pkgs, ... }:

{
  programs.bun = {
    enable = true;
  };

  programs.npm = {
    enable = true;

    settings = {
      cache = "${config.xdg.dataHome}/npm/cache";
      prefix = "${config.xdg.dataHome}/npm";
    };
  };

  home.sessionVariables = {
    BUN_INSTALL = "${config.xdg.dataHome}/bun";
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/node_repl_history";
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/bun/bin"
    "${config.xdg.dataHome}/npm/bin"
  ];

  home.packages = with pkgs; [
    typescript
  ];
}
