#!/usr/bin/env bash
set -euo pipefail

if ! brew list | grep -e '^bash$' >/dev/null; then
  brew install bash
fi
