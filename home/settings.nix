{ config, lib, ... }:

{
  options.my = {
    user = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "Dhanush Shetty";
        description = "Full name of the user.";
      };
      githubEmail = lib.mkOption {
        type = lib.types.str;
        default = "154754292+dhanush0x96c@users.noreply.github.com";
        description = "GitHub private email address.";
      };
      gitlabEmail = lib.mkOption {
        type = lib.types.str;
        default = "25153585-dhanush0x96c@users.noreply.gitlab.com";
        description = "GitLab private email address.";
      };
    };

    terminal = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "kitty";
        description = "Executable name of preferred terminal emulator.";
      };
      desktop = lib.mkOption {
        type = lib.types.str;
        default = "kitty.desktop";
        description = "Desktop file name of preferred terminal emulator.";
      };
    };

    browser = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "zen-beta";
        description = "Executable name of preferred web browser.";
      };
      desktop = lib.mkOption {
        type = lib.types.str;
        default = "zen-beta.desktop";
        description = "Desktop file name of preferred web browser.";
      };
    };

    editor = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "nvim";
        description = "Executable name of preferred text editor.";
      };
    };

    paths = {
      gdrive = lib.mkOption {
        type = lib.types.str;
        default = "${config.home.homeDirectory}/gdrive";
        description = "Local mount path for Google Drive via rclone.";
      };
      githubProjects = lib.mkOption {
        type = lib.types.str;
        default = "${config.home.homeDirectory}/Projects/github";
        description = "Local path to GitHub projects directory.";
      };
      gitlabProjects = lib.mkOption {
        type = lib.types.str;
        default = "${config.home.homeDirectory}/Projects/gitlab";
        description = "Local path to GitLab projects directory.";
      };
      notes = lib.mkOption {
        type = lib.types.str;
        default = "${config.home.homeDirectory}/Notes";
        description = "Local path to the Notes vault.";
      };
      passwords = lib.mkOption {
        type = lib.types.str;
        default = "${config.home.homeDirectory}/Passwords/Passwords.kdbx";
        description = "Path to KeePassXC password database.";
      };
    };
  };
}
