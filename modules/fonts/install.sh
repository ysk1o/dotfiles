#!/usr/bin/env bash
set -euo pipefail

brew tap homebrew/cask-fonts

if [ ! -s "$HOME"/Library/Fonts/HackGenConsole-Regular.ttf ]; then
  brew install font-hackgen
fi

if [ ! -s "$HOME"/Library/Fonts/HackGenNerd-Regular.ttf ]; then
  brew install font-hackgen-nerd
fi
