{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "zdev" (builtins.readFile ./scripts/zdev.sh))
  ];
}
