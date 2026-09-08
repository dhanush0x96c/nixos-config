{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bluetui
    (writeShellScriptBin "bluetooth-connect-last" (builtins.readFile ./bluetooth-connect-last.sh))
  ];
}
