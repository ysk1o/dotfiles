#!/usr/bin/env bash
set -euo pipefail

# install
if ! command -v asdf >/dev/null 2>&1; then
  brew install asdf
   . /usr/local/opt/asdf/libexec/asdf.sh
fi

# symlink
ln -snf "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)/asdfrc" "$HOME/.asdfrc"

# export
# . "$(brew --prefix asdf)"/asdf.sh
# . "$(brew --prefix asdf)"/etc/bash_completion.d/asdf.bash
