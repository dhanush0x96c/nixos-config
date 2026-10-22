{ config, pkgs, ... }:

{
  programs.uv = {
    enable = true;
  };

  home.sessionVariables = {
    PYTHONUSERBASE = "${config.xdg.dataHome}/python";
    PYTHON_HISTORY = "${config.xdg.dataHome}/python_history";
    UV_TOOL_BIN_DIR = "${config.xdg.dataHome}/uv/bin";
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/uv/bin"
  ];

  home.packages = with pkgs; [
    python315
  ];
}
