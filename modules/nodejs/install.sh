#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="nodejs"
COMMAND_NAME="node"

if echo $(asdf plugin list) | grep -v "$PLUGIN_NAME" >/dev/null; then
  asdf plugin add "$PLUGIN_NAME"
fi

if echo "$(which $COMMAND_NAME)" | grep -v .asdf >/dev/null; then
  asdf install "$PLUGIN_NAME" $(asdf list-all "$PLUGIN_NAME" | tail -n 1)
fi
