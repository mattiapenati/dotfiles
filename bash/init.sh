#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [ -e $HOME/.profile ]; then
    mv $HOME/.profile $HOME/.profile.old_version
fi
echo "[[ -r $DIR/dotfiles/_profile ]] && . $DIR/dotfiles/_profile" > ~/.profile

if [ -e $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.old_version
fi
echo "[[ -r ~/.profile ]] && . ~/.profile" > ~/.bashrc
