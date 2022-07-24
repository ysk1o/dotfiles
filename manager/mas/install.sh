#!/usr/bin/env bash
set -euo pipefail

if ! command -v mas >/dev/null 2>&1; then
  brew install mas
fi
