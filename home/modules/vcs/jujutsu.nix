{ config, ... }: {
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
    };
  };
}
