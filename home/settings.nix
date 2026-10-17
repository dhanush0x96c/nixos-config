{ config, lib, ... }:

{
  options.my = {
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
