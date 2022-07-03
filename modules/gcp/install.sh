#!/usr/bin/env bash
set -euo pipefail

if ! brew list | grep -e '^google-cloud-sdk$' >/dev/null; then
  brew install --cask google-cloud-sdk
fi
