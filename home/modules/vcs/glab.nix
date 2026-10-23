{ pkgs, ... }:

{
  home.packages = [
    pkgs.glab
  ];

  programs.git.settings.credential = {
    "https://gitlab.com" = {
      helper = [
        ""
        "${pkgs.glab}/bin/glab auth git-credential"
      ];
    };
  };
}
