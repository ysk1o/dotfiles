#!/usr/bin/env bash
set -euo pipefail

if ! brew list | grep -e '^git$' >/dev/null; then
  brew install git
fi
