#!/usr/bin/env bash

LOG_DIR="$HOME/.local/state"
LOG_FILE="$LOG_DIR/nixos-rebuild.log"

mkdir -p "$LOG_DIR"

# Send initial notification
notify-send -u normal "NixOS Rebuild" "Rebuild started in the background..." -i system-software-update

echo "=== Rebuild started at $(date) ===" >> "$LOG_FILE"

# Execute the rebuild
if sudo nixos-rebuild switch --flake /home/dhanush/nixos-config#tesseract >> "$LOG_FILE" 2>&1; then
  echo "=== Rebuild completed successfully at $(date) ===" >> "$LOG_FILE"
  notify-send -u normal "NixOS Rebuild" "Rebuild completed successfully!" -i software-update-available
else
  echo "=== Rebuild failed at $(date) ===" >> "$LOG_FILE"
  notify-send -u critical "NixOS Rebuild" "Rebuild failed! See $LOG_FILE" -i software-update-urgent
fi

