KEEP_CURRENT=0

while [[ "$#" -gt 0 ]]; do
  case $1 in
    -k|--keep) KEEP_CURRENT=1 ;;
    *) echo "Usage: zclean [-k|--keep]" ; exit 1 ;;
  esac
  shift
done

if [ "$KEEP_CURRENT" -eq 1 ]; then
  if [ -z "$ZELLIJ_SESSION_NAME" ]; then
    echo "Error: Not inside a Zellij session. Cannot use --keep."
    exit 1
  fi
  
  if SESSIONS=$(zellij list-sessions -s -n 2>/dev/null); then
    echo "$SESSIONS" | while read -r session; do
      if [ -n "$session" ] && [ "$session" != "$ZELLIJ_SESSION_NAME" ]; then
        zellij delete-session -f "$session" >/dev/null 2>&1
      fi
    done
  fi
else
  nohup sh -c 'zellij kill-all-sessions -y; zellij delete-all-sessions -y' >/dev/null 2>&1 &
fi
