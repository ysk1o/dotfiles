#!/usr/bin/env bash
set -euo pipefail

if ! xcode-select -p > /dev/null 2>&1; then
  echo "Xcode Command Line Tools are not installed."
  echo "Please run the following command and re-run this script:"
  echo ""
  echo "  xcode-select --install"
  echo ""
  exit 1
fi

DOTPATH=$HOME/dotfiles

if [ ! -d "$DOTPATH" ]; then
  git clone https://github.com/ysk1o/dotfiles.git "$DOTPATH"
  cd "$DOTPATH"
else
  echo "$DOTPATH already downloaded. Updating..."
  cd "$DOTPATH"
  git stash
  git checkout main
  git pull origin main
  echo
fi

# install homebrew
if command -v brew >/dev/null 2>&1; then
  brew update
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo
fi

./install_font.sh # install font

# Symbolic link
ln -sf "$DOTPATH/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTPATH/.inputrc" "$HOME"/".inputrc" # .inputrc
ln -sf "$DOTPATH/.editorconfig" "$HOME/.editorconfig"

echo
