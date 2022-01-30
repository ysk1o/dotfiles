#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="awscli"
COMMAND_NAME="aws"

if ! asdf plugin list | grep "$PLUGIN_NAME" >/dev/null; then
  asdf plugin add "$PLUGIN_NAME"
fi

if which "$COMMAND_NAME" | grep -v .asdf >/dev/null; then
  asdf install "$PLUGIN_NAME" "$(asdf list-all "$PLUGIN_NAME" | tail -n 1)"
fi
