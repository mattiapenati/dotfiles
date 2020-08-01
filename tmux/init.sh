#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [ -e $HOME/.tmux.conf ]; then
    mv $HOME/.tmux.conf $HOME/.tmux.conf.old_version
fi
ln -sv $DIR/dotfiles/_tmux.conf $HOME/.tmux.conf
