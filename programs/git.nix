{ pkgs, ... }:
{

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Dhanush Shetty";
        email = "154754292+dhanush0x96c@users.noreply.github.com";
      };

      init.defaultBranch = "main";

      core = {
        editor = "nvim";
        autocrlf = "input";
      };

      merge.conflictstyle = "zdiff3";

      # TODO: Configure difftool and mergetool
    };
  };

  programs.gh.enable = true;

  programs.lazygit.enable = true;

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
