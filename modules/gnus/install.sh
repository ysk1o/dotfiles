#!/usr/bin/env bash
set -euo pipefail

### gnu basic command
if ! brew list | grep -e '^coreutils$' >/dev/null; then
  brew install coreutils
fi

### gnu diff command
if ! brew list | grep -e '^coreutils$' >/dev/null; then
  brew install diffutils
fi

### gnu ed command
if ! ed --version | grep GNU >/dev/null; then
  brew install ed
fi

### gnu sed command
if ! command -v gsed >/dev/null 2>&1; then
  brew install gnu-sed
fi

### gnu find, locate, updatedb, xargs
if ! command -v gfind >/dev/null 2>&1; then
  brew install findutils
fi

### gnu gawk command
if ! command -v gawk >/dev/null 2>&1; then
  brew install gawk
fi

### gnu grep command
if ! command -v ggrep >/dev/null 2>&1; then
  brew install grep
fi

### gun unzip, gzexe, gzip, uncompress, zcat,
### zcmp, zdiff, zegrep, zfgrep, zforce, zgrep,
### zless, zmore, znew command
if ! command -v gunzip >/dev/null 2>&1; then
  brew install gzip
fi

# gnu tar command
if ! command -v gtar >/dev/null 2>&1; then
  brew install gnu-tar
fi
