#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -e $HOME/.zshenv ]; then
    mv $HOME/.zshenv $HOME/.zshenv.old_version
fi
echo "[[ -r $DIR/dotfiles/_zshenv ]] && . $DIR/dotfiles/_zshenv" > ~/.zshenv

if [ -e $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc.old_version
fi
echo "[[ -r $DIR/dotfiles/_zshrc ]] && . $DIR/dotfiles/_zshrc" > ~/.zshrc

if [[ "$(uname -s)" == "Darwin" ]]; then
    brew install fzf
    echo "[[ -r \$(brew --prefix)/opt/fzf/shell/completion.zsh ]] && . \$(brew --prefix)/opt/fzf/shell/completion.zsh" >> ~/.zshrc
    echo "[[ -r \$(brew --prefix)/opt/fzf/shell/key-bindings.zsh ]] && . \$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" >> ~/.zshrc
fi

