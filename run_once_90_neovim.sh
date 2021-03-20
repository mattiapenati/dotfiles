#!/bin/sh
set -eu
IFS=$'\n\t'

[ -e ~/.local/share/nvim/site/autoload/plug.vim ] || \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COC_EXTENSIONS="coc-clangd coc-cmake coc-fzf-preview coc-json coc-pairs"
COC_EXTENSIONS="$COC_EXTENSIONS coc-pyright coc-python coc-rust-analyzer"
COC_EXTENSIONS="$COC_EXTENSIONS coc-toml coc-xml coc-yaml"

npm install -g neovim
nvim --headless -c PlugInstall -c qa
nvim --headless -c "CocInstall -sync $COC_EXTENSIONS" -c qa
