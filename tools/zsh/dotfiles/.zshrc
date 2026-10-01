# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history inc_append_history append_history

# PATH
export PATH="$HOME/.local/bin:$PATH"

# tab title change
DISABLE_AUTO_TITLE="true"

function tabname() {
  echo -ne "\033]0;$1\007"
}

# tools/*/export.zshを読み込む
DOTFILES_PATH="$HOME/.local/share/dotfiles"
for file in $DOTFILES_PATH/tools/*/export.zsh; do
  if [ -f "$file" ]; then
    source "$file"
  fi
done
