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

From any directory, `dotfiles <target>` (defined in `.zshrc`) runs the same targets, e.g. `dotfiles upgrade`.

## Layout

- `config.yaml` — macOS defaults and Homebrew tools
- `tools/<command>/dotfiles/` — symlinked into `$HOME` with the same relative path
- `tools/<command>/post_install.sh` — run after the tool is installed
- `tools/<command>/export.zsh` — sourced by `.zshrc`

`dotfiles/` and `post_install.sh` are only processed for tools listed in `config.yaml`. `export.zsh` is sourced for every directory under `tools/`.

Tools with `pin: true` are excluded from `brew upgrade`.
