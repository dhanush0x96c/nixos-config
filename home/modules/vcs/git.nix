{ config, ... }:

{

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = config.my.user.name;
        email = config.my.user.githubEmail;
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
