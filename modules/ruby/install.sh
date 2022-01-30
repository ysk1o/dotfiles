#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="ruby"
COMMAND_NAME="ruby"

if ! asdf plugin list | grep "$PLUGIN_NAME" >/dev/null; then
  asdf plugin add "$PLUGIN_NAME"
fi

if which "$COMMAND_NAME" | grep -v .asdf >/dev/null; then
  asdf install "$PLUGIN_NAME" 2.7.5
fi
