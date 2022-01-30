#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="firebase"
COMMAND_NAME="firebase"

if ! asdf plugin list | grep "$PLUGIN_NAME" >/dev/null; then
  asdf plugin add "$PLUGIN_NAME"
fi

if "$COMMAND_NAME" | grep -v .asdf >/dev/null; then
  asdf install "$PLUGIN_NAME" "$(asdf list-all "$PLUGIN_NAME" | tail -n 1)"
fi
