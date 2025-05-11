#!/usr/bin/env bash
set -euo pipefail

if ! command -v mise >/dev/null 2>&1; then
  echo ">> Installing mise..."
  brew install mise
else
  echo ">> mise already installed"
fi

# mise trust に必要な config.toml のリンクがあるか確認（存在していれば trust）
CONFIG_TOML="$DOTPATH/mise/config.toml"
if [ -f "$CONFIG_TOML" ]; then
  echo ">> Trusting mise config: $CONFIG_TOML"
  mise trust "$CONFIG_TOML"
else
  echo "!! No config.toml found at $CONFIG_TOML"
fi

ln -sf "$DOTPATH/mise/config.toml" "$HOME/.config/mise/config.toml"
