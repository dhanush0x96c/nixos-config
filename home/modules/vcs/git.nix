_:

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

      diff.tool = "nvimdiff";
      difftool.prompt = false;

      merge = {
        conflictstyle = "zdiff3";
        tool = "nvimdiff";
      };

      mergetool = {
        prompt = false;
        keepBackup = false;
        nvimdiff.layout = "LOCAL,MERGED,REMOTE";
      };
    };
  };
}
