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
      atuin \
      bandwhich \
      bat \
      btop \
      cargo-binstall \
      cargo-edit \
      cargo-nextest \
      cargo-update \
      chezmoi \
      direnv \
      fd \
      fnm \
      font-cascadia-mono-nf \
      fzf \
      gh \
      git \
      gitui \
      git-delta \
      git-interactive-rebase-tool \
      hyperfine \
      htop \
      jless \
      jq \
      just \
      lazygit \
      neovim \
      node \
      ripgrep \
      sccache \
      starship \
      stylua \
      taplo \
      tmux \
      tokei \
      topgrade \
      zsh \
      zsh-autosuggestions \
      zsh-syntax-highlighting
esac
