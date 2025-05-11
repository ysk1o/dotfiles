# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# custom path
export DOTPATH="$HOME/dotfiles"

# Locale
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history inc_append_history append_history

# export
source "$DOTPATH/postgresql/export.zsh"
source "$DOTPATH/zsh/export.zsh"
source "$DOTPATH/git/export.zsh"
source "$DOTPATH/eza/export.zsh"
source "$DOTPATH/starship/export.zsh"
source "$DOTPATH/mise/export.zsh"
source "$DOTPATH/completions/export.zsh" # last
