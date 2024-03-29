#!/usr/bin/env bash
set -euo pipefail

DOTPATH=$HOME/dotfiles

if [ ! -d "$DOTPATH" ]; then
  git clone https://github.com/ysk1o/dotfiles.git "$DOTPATH"
  cd "$DOTPATH"
  git remote set-url origin git@github.com:ysk1o/dotfiles.git
  git config --local user.name ysk1o
  git config --local user.email contact@ysk1o.com
else
  echo "$DOTPATH already downloaded. Updating..."
  cd "$DOTPATH"
  git stash
  git checkout master
  git pull origin master
  echo
fi

# install homebrew
if command -v brew >/dev/null 2>&1; then
  brew update
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo
fi

# install
for f in "./modules/"*"/install.sh"
do
  echo "Execute installation script ${f}"
  chmod a+x "${f}"
  sh -c "${f}"
  echo "Finish installation script ${f}"
done

# load .bash_profile
source .bash_profile

# set symbolic link
for file in .??*; do
  [[ "$file" == ".git" ]] && continue
  [[ "$file" == ".gitignore" ]] && continue
  [[ "$file" == ".DS_Store" ]] && continue
  [[ "$file" == ".vscode" ]] && file=".vscode/settings.json"
  ln -sf "$DOTPATH"/"$file" "$HOME"/"$file"
done
echo

echo "Bootstrapping DONE"
