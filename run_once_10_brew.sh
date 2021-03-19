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
         bat \
         chezmoi \
         direnv \
         fd \
         fnm \
         fzf \
         git \
         git-delta \
         git-interactive-rebase-tool \
         gitui \
         htop \
         jless \
         lsd \
         neovim \
         node \
         ripgrep \
         starship \
         stylua \
         tmux \
         topgrade
esac
