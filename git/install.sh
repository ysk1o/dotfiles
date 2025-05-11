#!/usr/bin/env bash
set -euo pipefail

BREW_GIT_PATH="$(brew --prefix)/bin/git"

if [[ -x "$BREW_GIT_PATH" ]]; then
  echo "✅ git is already installed via Homebrew at $BREW_GIT_PATH. Skipping."
else
  echo "🚀 Installing git via Homebrew..."
  brew install git
  echo "✅ git installed."
fi
