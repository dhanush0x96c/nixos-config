{ config, ... }:

{
  programs.rclone = {
    enable = true;

    remotes = {
      gdrive = {
        config = {
          type = "drive";
          scope = "drive";
        };

        secrets = {
          client_id = "${config.home.homeDirectory}/.config/rclone/client_id";
          client_secret = "${config.home.homeDirectory}/.config/rclone/client_secret";
          token = "${config.home.homeDirectory}/.config/rclone/token.json";
        };

        mounts = {
          "" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/gdrive";
          };
        };
      };
    };
  };
}
