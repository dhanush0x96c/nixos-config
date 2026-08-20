set -o pipefail

LOG_DIR="$HOME/.local/state"
LOG_FILE="$LOG_DIR/nixos-rebuild.log"

mkdir -p "$LOG_DIR"

notify-send -u normal "NixOS Rebuild" "Rebuild started..." -i system-software-update

echo "=== Rebuild started at $(date) ===" | tee -a "$LOG_FILE"

if sudo nixos-rebuild switch --flake @FLAKE_PATH@#@FLAKE_NAME@ 2>&1 | tee -a "$LOG_FILE"; then
  echo "=== Rebuild completed successfully at $(date) ===" | tee -a "$LOG_FILE"
  notify-send -u normal "NixOS Rebuild" "Rebuild completed successfully!" -i software-update-available
else
  echo "=== Rebuild failed at $(date) ===" | tee -a "$LOG_FILE"
  notify-send -u critical "NixOS Rebuild" "Rebuild failed! See $LOG_FILE" -i software-update-urgent
  exit 1
fi
