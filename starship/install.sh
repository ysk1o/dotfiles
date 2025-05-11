#!/usr/bin/env bash
set -euo pipefail

if command -v starship &>/dev/null; then
  echo "✅ starship is already installed. Skipping."
else
  echo "🚀 Installing starship..."
  brew install starship
fi

mkdir -p "$HOME/.config"
ln -sf "$DOTPATH/starship/starship.toml" "$HOME/.config/starship.toml"
