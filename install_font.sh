#!/bin/bash
set -euo pipefail

# ダウンロード先とファイル名
FONT_URL="https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_NF_v2.10.0.zip"
TMP_DIR="$(mktemp -d)"
ZIP_PATH="$TMP_DIR/HackGen_NF_v2.10.0.zip"

# ダウンロード
echo "📦 Downloading font..."
curl -L "$FONT_URL" -o "$ZIP_PATH"

# 解凍
echo "📂 Unzipping..."
unzip -q "$ZIP_PATH" -d "$TMP_DIR"

# フォントをインストール（~/Library/Fonts にコピー）
echo "📝 Installing fonts..."
cp "$TMP_DIR/HackGen_NF_v2.10.0/HackGenConsoleNF-Regular.ttf" ~/Library/Fonts/
cp "$TMP_DIR/HackGen_NF_v2.10.0/HackGenConsoleNF-Bold.ttf" ~/Library/Fonts/

# 後片付け
echo "🧹 Cleaning up..."
rm -rf "$TMP_DIR"

echo "✅ Done! フォントを iTerm2 や VSCode に設定してください。"
