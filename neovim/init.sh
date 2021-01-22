#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

if [[ "$(uname -s)" == "Linux" ]]; then
    mkdir -p $HOME/.local/bin
    export PATH=$HOME/.local/bin:$PATH
    curl -fLo $HOME/.local/bin/nvim \
        https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod u+x $HOME/.local/bin/nvim
fi

if [[ "$(uname -s)" == "Darwin" ]]; then
    brew install neovim
fi

curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/.config/nvim
if [ -e $HOME/.config/nvim/init.vim ]; then
    mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.old_version
fi
ln -sv $DIR/dotfiles/_config/nvim/init.vim $HOME/.config/nvim/init.vim
if [ -e $HOME/.config/nvim/coc-settings.json ]; then
    mv $HOME/.config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json.old_version
fi
ln -sv $DIR/dotfiles/_config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json

npm install -g neovim
nvim --headless \
    -c PlugInstall \
    -c qa
nvim --headless \
    -c "CocInstall -sync coc-json coc-cmake coc-rust-analyzer coc-fzf-preview coc-pairs coc-python coc-clangd" \
    -c qa
