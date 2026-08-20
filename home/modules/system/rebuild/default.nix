{ pkgs, ... }:

let
  flakePath = "/home/dhanush/nixos-config";
  flakeName = "tesseract";
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "rebuild" (
      builtins.replaceStrings
        [
          "@FLAKE_PATH@"
          "@FLAKE_NAME@"
        ]
        [
          flakePath
          flakeName
        ]
        (builtins.readFile ./rebuild.sh)
    ))
  ];
}
