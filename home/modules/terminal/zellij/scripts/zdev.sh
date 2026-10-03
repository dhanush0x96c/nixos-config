AGENT_CMD="${AGENT_CMD:-codex}"
if [ "$#" -gt 0 ] && [[ ! "$1" == -* ]]; then
  AGENT_CMD="$1"
  shift
fi
export AGENT_CMD

SESSION_NAME="zdev-$$"

if [ -n "$ZELLIJ" ]; then
  zellij attach -b "$SESSION_NAME" options --default-layout dev
  zellij action switch-session "$SESSION_NAME"
else
  zellij -s "$SESSION_NAME" options --default-layout dev
fi
