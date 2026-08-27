{ config, ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = config.programs.git.settings.user.name;
        email = config.programs.git.settings.user.email;
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
