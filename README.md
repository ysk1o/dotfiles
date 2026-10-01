# dotfiles

My macOS setup.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/ysk1o/dotfiles/main/bootstrap.sh | bash
```

## Usage

```sh
make install   # install tools, apply macOS defaults, link dotfiles
make dryrun    # show what install would do
make upgrade   # brew update && brew upgrade && brew cleanup
```

`VERBOSE=1 make install` shows command output.

## Layout

- `config.yaml` — macOS defaults and Homebrew tools
- `tools/<command>/dotfiles/` — symlinked into `$HOME` with the same relative path
- `tools/<command>/post_install.sh` — run after the tool is installed
- `tools/<command>/export.zsh` — sourced by `.zshrc`

Tools with `pin: true` are excluded from `brew upgrade`.
