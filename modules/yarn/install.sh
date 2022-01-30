#!/usr/bin/env bash
set -euo pipefail

if ! echo $(brew list | grep -e '^yarn$') >/dev/null; then
  brew install yarn
fi
