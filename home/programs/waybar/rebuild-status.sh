#!/usr/bin/env bash
if pgrep nixos-rebuild > /dev/null; then
  echo '{"text": " ", "class": "running", "tooltip": "NixOS rebuild is running"}'
else
  echo '{"text": " ", "class": "stopped", "tooltip": "NixOS rebuild is not running"}'
fi
