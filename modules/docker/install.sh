#!/usr/bin/env bash
set -euo pipefail

### gnu sed command
if ! command -v docker >/dev/null 2>&1; then
  # docker and docker-compose
  brew install --cask docker
fi

# completion for docker
if [ ! -e $(brew --prefix)/etc/bash_completion.d/docker ]; then
  curl -L \
    https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker \
    > $(brew --prefix)/etc/bash_completion.d/docker
fi

# completion for docker-compose
if [ ! -e $(brew --prefix)/etc/bash_completion.d/docker-compose ]; then
  curl -L \
    https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose \
    > $(brew --prefix)/etc/bash_completion.d/docker-compose
fi
