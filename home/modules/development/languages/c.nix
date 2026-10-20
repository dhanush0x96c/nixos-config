{ pkgs, ... }:

{
  programs.gcc = {
    enable = true;
  };

  home.packages = with pkgs; [
    clang-tools
    cmake
    gdb
    gnumake
  ];
}
