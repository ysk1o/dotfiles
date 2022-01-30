#!/usr/bin/env bash
set -euo pipefail

# install
if ! command -v asdf >/dev/null 2>&1; then
  brew install asdf
fi

# symlink
ln -snf "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)/asdfrc" "$HOME/.asdfrc"
