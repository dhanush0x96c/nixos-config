{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "zdev" (builtins.readFile ./scripts/zdev.sh))
    (pkgs.writeShellScriptBin "zclean" (builtins.readFile ./scripts/zclean.sh))
  ];
}
