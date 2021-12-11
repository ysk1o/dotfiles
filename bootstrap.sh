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
echo

# Node.js install
if [ ! -d "$HOME/.nodenv" ] ; then
    git clone git://github.com/nodenv/nodenv.git $HOME/.nodenv
fi
if [ ! -d "$HOME/.nodenv/plugins/node-build" ] ; then
    git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build
fi
if [ ! -d "$HOME/.nodenv/plugins/node-build-update-defs" ] ; then
    git clone https://github.com/nodenv/node-build-update-defs.git $HOME/.nodenv/plugins/node-build-update-defs
fi
echo

# sdkman install
if [ -z "$SDKMAN_DIR" ]; then
    SDKMAN_DIR="$HOME/.sdkman"
fi

if ! [ -d "$SDKMAN_DIR" ]; then
  curl -s "https://get.sdkman.io" | bash
fi
echo

# iterm2 settings
ln -sf "$DOTPATH/iterm2/com.googlecode.iterm2.plist" "$HOME/Library/Preferences/com.googlecode.iterm2.plist"

echo "Bootstrapping DONE"
