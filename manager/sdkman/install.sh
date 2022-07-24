#!/usr/bin/env bash
set -euo pipefail

if ! command -v sdk >/dev/null; then
  curl -s "https://get.sdkman.io" | bash
fi
