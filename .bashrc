# general
alias ls='ls -G'
alias la='ls -la'
alias ll='ls -l'
alias grep='grep --color=auto'

# git
alias gs='git status'
alias gaa='git add -A'
alias gc='git commit -m'

# docker
alias d='docker'
alias dps='docker ps'
alias dpa='docker ps -all'
alias de='docker exec'
alias dr='docker run -it --rm'
alias drm='docker rm'
alias dra='docker rm $(docker ps --all --quiet)'

# docker images
alias di="docker images"
alias dia="docker images --all"

# docker-compose
alias dc='docker-compose'

# terraform
alias tf=terraform

# aws
complete -C aws_completer aws

# bash completion
source /usr/local/etc/bash_completion

# history
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000

# PS1 git completion
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# PS1 setting
BEGIN="\[\e[0;30;42m\]"
BEGIN_TRIANGLE="\[\e[0;32;47m\]"
HOSTNAME=`hostname -s`
MIDDLE="\[\e[0;30;47m\]"
MIDDLE_TRIANGLE="\[\e[0;37m\]"
END="\[\e[m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="${BEGIN} \u@${HOSTNAME} ${BEGIN_TRIANGLE}${MIDDLE} \W\$(__git_ps1) ${MIDDLE_TRIANGLE}${END} "

# gnu-sed(required brew install gnu-sed)
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

export PATH="$HOME/.nodenv/versions/*/bin:$PATH"

export LANG="ja_JP.UTF-8"
export HISTTIMEFORMAT='%y-%m-%d %H:%M:%S '
export HISTFILESIZE=10000
export HOMEBREW_BUNDLE_NO_LOCK=true

# nodenv settings
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Ruby settings
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Java settings
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH
export SDKMAN_DIR="$HOME/.sdkman"
if [ -d "${SDKMAN_DIR}" ]; then
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
