#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Installing Zsh completions and enhancements..."

packages=(
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

for pkg in "${packages[@]}"; do
  if brew list "$pkg" &>/dev/null; then
    echo "✅ $pkg is already installed. Skipping."
  else
    echo "📦 Installing $pkg..."
    brew install "$pkg"
  fi
done

echo "🔐 Fixing directory permissions to avoid compinit warnings..."
chmod go-w "$(brew --prefix)/share" || true
chmod -R go-w "$(brew --prefix)/share/zsh" || true

echo
echo "ℹ️ If completions don't work properly, try running:"
echo "   rm ~/.zcompdump; exec zsh"
echo

echo "✅ Zsh completion tools are installed and ready."
