#!/usr/bin/env bash
set +u

# install
ASDF_DIR=""
if ! command -v asdf >/dev/null 2>&1; then
  brew install asdf
   . /usr/local/opt/asdf/libexec/asdf.sh
fi

# symlink
# ln -snf "$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)/asdfrc" "$HOME/.asdfrc"

# export
# source "$(dirname "${BASH_SOURCE:-$0}")/export.bash"
