{ pkgs, ... }: {

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      navigate = true;
      dark = true;
      hyperlinks = true;
      syntax-theme = "base16-stylix";

      # TODO: Configure program to open
      # hyperlinks-file-link-format = "";

      # TODO: Configure delta color scheme
      # features = "";
    };
  };
}
