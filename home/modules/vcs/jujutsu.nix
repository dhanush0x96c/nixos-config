{ config, ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = config.my.user.name;
        email = config.my.user.githubEmail;
      };
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
