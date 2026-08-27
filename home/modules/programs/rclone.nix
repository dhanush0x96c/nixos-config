{ config, pkgs, ... }:

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

  systemd.user.services.rclone-sync-gdrive = {
    Unit = {
      Description = "Sync Passwords and Notes to Google Drive via rclone";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "rclone-sync-gdrive" ''
        PASSWORDS_FILE="${config.home.homeDirectory}/Passwords/Passwords.kdbx"
        NOTES_DIR="${config.home.homeDirectory}/Notes"

        if [ -f "$PASSWORDS_FILE" ]; then
          echo "Copying Passwords.kdbx to Google Drive..."
          ${pkgs.rclone}/bin/rclone copy "$PASSWORDS_FILE" "gdrive:Passwords"
        fi

        if [ -d "$NOTES_DIR" ]; then
          echo "Syncing Notes to Google Drive..."
          ${pkgs.rclone}/bin/rclone sync "$NOTES_DIR" "gdrive:Notes"
        fi
      ''}";
    };
  };

  systemd.user.timers.rclone-sync-gdrive = {
    Unit = {
      Description = "Timer for rclone Google Drive sync service";
    };

    Timer = {
      OnCalendar = "hourly";
      Persistent = true;
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
