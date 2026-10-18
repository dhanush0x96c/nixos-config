{ config, ... }:

{
  programs.go = {
    enable = true;

    env = {
      GOPATH = "${config.xdg.dataHome}/go";
    };
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/go/bin"
  ];
}
