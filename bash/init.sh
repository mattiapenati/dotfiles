#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [[ "$(uname -s)" == "Linux" ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

if [ -e $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.old_version
fi
echo "[[ -r $DIR/dotfiles/_bashrc ]] && . $DIR/dotfiles/_bashrc" > ~/.bashrc

if [ -e $HOME/.bash_profile ]; then
    mv $HOME/.bash_profile $HOME/.bash_profile.old_version
fi
echo "[[ -r \$HOME/.bashrc ]] && . \$HOME/.bashrc" > ~/.bash_profile
