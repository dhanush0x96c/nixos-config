{ pkgs, ... }: {

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
}
