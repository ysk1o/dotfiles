#!/usr/bin/env bash
set -euo pipefail

if ! brew list | grep -e '^iterm2$' >/dev/null; then
  brew install --cask iterm2
fi
