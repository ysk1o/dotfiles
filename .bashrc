# path
DOTPATH="$HOME"/dotfiles
. "$DOTPATH"/modules/export.bash

# general
alias ls='ls -G'
alias la='ls -la'
alias ll='ls -l'

# history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTTIMEFORMAT='%y-%m-%d %H:%M:%S '
export HISTFILESIZE=10000

# lang
export LANG="ja_JP.UTF-8"

# PS1 setting
BEGIN="\[\e[0;30;42m\]"
BEGIN_TRIANGLE="\[\e[0;32;47m\]"
HOSTNAME="$(hostname -s)"
MIDDLE="\[\e[0;30;47m\]"
MIDDLE_TRIANGLE="\[\e[0;37m\]"
END="\[\e[m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="${BEGIN} \u@${HOSTNAME} ${BEGIN_TRIANGLE}${MIDDLE} \W\$(__git_ps1) ${MIDDLE_TRIANGLE}${END} "
