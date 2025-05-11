#!/usr/bin/env bash
set -euo pipefail

BREW_ZSH_PATH="$(brew --prefix)/bin/zsh"

# Homebrew の zsh が存在するか確認
if [[ -x "$BREW_ZSH_PATH" ]]; then
  echo "✅ Homebrew zsh is already installed at $BREW_ZSH_PATH. Skipping."
else
  echo "🚀 Installing zsh via Homebrew..."
  brew install zsh
  echo "✅ zsh installed at $BREW_ZSH_PATH."
fi

if ! grep -q "^$BREW_ZSH_PATH\$" /etc/shells; then
  echo "🔧 Adding $BREW_ZSH_PATH to /etc/shells (requires sudo)"
  echo "$BREW_ZSH_PATH" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$BREW_ZSH_PATH" ]]; then
  echo "🔄 Changing default shell to $BREW_ZSH_PATH"
  chsh -s "$BREW_ZSH_PATH"
  echo ""
  echo "✅ Default shell updated. Please open a new terminal tab to continue using the new shell."
  exit 0
fi
