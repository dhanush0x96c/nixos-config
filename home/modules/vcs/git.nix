{ config, ... }:

{

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = config.my.user.name;
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

    includes = [
      {
        condition = "gitdir:${config.my.paths.githubProjects}/";
        contents = {
          user = {
            email = config.my.user.githubEmail;
          };
        };
      }
      {
        condition = "gitdir:${config.my.paths.gitlabProjects}/";
        contents = {
          user = {
            email = config.my.user.gitlabEmail;
          };
        };
      }
    ];
  };
}
