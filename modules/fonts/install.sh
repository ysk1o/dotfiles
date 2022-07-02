#!/usr/bin/env bash
set -euo pipefail

if ! brew tap | grep -e '^homebrew/cask-fonts$' >/dev/null; then
  brew tap homebrew/cask-fonts
fi

# install font-hackgen
if ! brew list | grep -e '^font-hackgen$' >/dev/null; then
  brew install --cask font-hackgen
fi

# install font-hackgen-nerd
if ! brew list | grep -e '^font-hackgen-nerd$' >/dev/null; then
  brew install --cask font-hackgen
fi
