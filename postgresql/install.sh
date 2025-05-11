#!/usr/bin/env bash
set -euo pipefail

# PostgreSQL のバージョン
POSTGRES_VERSION="17"

# mise で PostgreSQL をインストール
if ! command -v postgres >/dev/null 2>&1; then
  echo "🚀 Installing postgresql@latest via mise..."
  mise install postgresql@latest
  mise use -g postgresql@latest
else
  echo "✅ PostgreSQL is already installed via mise."
fi

if [[ ! -x "$(brew --prefix libpq)/bin/pg_config" ]]; then
  echo "🔧 Installing libpq via Homebrew..."
  brew install libpq
else
  echo "✅ libpq is already installed via Homebrew."
fi
