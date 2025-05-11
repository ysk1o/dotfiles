#!/usr/bin/env bash
set -euo pipefail

if ! command -v eza >/dev/null 2>&1; then
  mise install eza@latest
fi
