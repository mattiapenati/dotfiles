#!/bin/sh
set -eu
IFS=$'\n\t'


case ${OSTYPE:-} in darwin*)
    if command -v brew &> /dev/null; then
        echo "homebrew already installed"
    else
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh
    fi

    brew tap buo/cask-upgrade
    brew install \
         bandwhich \
         chezmoi \
         direnv \
         fnm \
         font-cascadia-mono-nf \
         fzf \
         git \
         gitui \
         htop \
         jless \
         lazygit \
         neovim \
         node \
         stylua \
         tmux
esac
