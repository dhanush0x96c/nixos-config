#!/usr/bin/env bash

# Send initial notification
notify-send -u normal "NixOS Rebuild" "Rebuild started in the background..." -i system-software-update

# Execute the rebuild
if sudo nixos-rebuild switch --flake /home/dhanush/nixos-config#tesseract > /dev/null 2>&1; then
  notify-send -u normal "NixOS Rebuild" "Rebuild completed successfully!" -i software-update-available
else
  notify-send -u critical "NixOS Rebuild" "Rebuild failed!" -i software-update-urgent
fi
