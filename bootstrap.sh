#!/usr/bin/env bash
set -euo pipefail

DOTPATH=$HOME/dotfiles

if [ ! -d "$DOTPATH" ]; then
  git clone https://github.com/ysk1o/dotfiles.git "$DOTPATH"
else
  echo "$DOTPATH already downloaded. Updating..."
  cd "$DOTPATH"
  git stash
  git checkout master
  git pull origin master
  echo
fi

cd "$DOTPATH"

# install homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo
fi
brew bundle
echo

# set symbolic link
for file in .??*; do
  [[ "$file" == ".git" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".DS_Store" ]] && continue
  [[ "$file" == ".vscode" ]] && file=".vscode/settings.json"
  ln -sf $DOTPATH/$file $HOME/$file
done
echo

# bash from brew
bash_path=/usr/local/bin/bash
if grep -q $bash_path /etc/shells; then
  echo $bash_path >> /etc/shells
  chsh -s $bash_path
fi

# sdkman install
curl -s "https://get.sdkman.io" | bash

# iterm2 settings
ln -sf "$DOTPATH/iterm2/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/com.googlecode.iterm2.plist"

echo "Bootstrapping DONE"
