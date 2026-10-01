#!/bin/bash
# Usage: curl -fsSL https://raw.githubusercontent.com/ysk1o/dotfiles/main/bootstrap.sh | bash
set -euo pipefail

# Wrapped in a function so a truncated download runs nothing
main() {
  local DOTFILES_PATH="$HOME/.local/share/dotfiles"

  # git and make come with the Xcode Command Line Tools
  if ! xcode-select -p >/dev/null 2>&1; then
    xcode-select --install
    echo "Waiting for Xcode Command Line Tools to be installed..."
    until xcode-select -p >/dev/null 2>&1; do
      sleep 5
    done
  fi

  if [ ! -d "$DOTFILES_PATH/.git" ]; then
    git clone https://github.com/ysk1o/dotfiles.git "$DOTFILES_PATH"
  fi

  make -C "$DOTFILES_PATH" install
}

main "$@"
