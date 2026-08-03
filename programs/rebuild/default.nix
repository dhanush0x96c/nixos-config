{ pkgs, ... }:

{
  home.file.".local/bin/rebuild.sh" = {
    source = ./rebuild.sh;
    executable = true;
  };
}
