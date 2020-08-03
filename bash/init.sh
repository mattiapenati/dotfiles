#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [ -e $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.old_version
fi
echo "[[ -r $DIR/dotfiles/_bashrc ]] && . $DIR/dotfiles/_bashrc" > ~/.bashrc
