{ config, ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = config.my.user.name;
      };
      "--scope" = [
        {
          "--when".repositories = [ config.my.paths.githubProjects ];
          user.email = config.my.user.githubEmail;
        }
        {
          "--when".repositories = [ config.my.paths.gitlabProjects ];
          user.email = config.my.user.gitlabEmail;
        }
      ];
      ui = {
        default-command = "log";
        pager = "delta";
        diff-formatter = ":git";
      };
      template-aliases = {
        "format_short_signature(signature)" = "signature.email().local()";
        "format_timestamp(timestamp)" = "timestamp.ago()";
        "commit_timestamp(commit)" = "commit.author().timestamp()";
      };
    };
  };
}
