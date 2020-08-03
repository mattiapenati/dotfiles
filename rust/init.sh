#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH=$HOME/.cargo/bin:$PATH
rustup component add rls rust-analysis rust-src
cargo install topgrade cargo-update
cargo install cargo-edit
cargo install fd-find ripgrep bat exa starship

mkdir -p $HOME/.config
if [ -e $HOME/.config/topgrade.toml ]; then
    mv $HOME/.config/topgrade.toml $HOME/.config/topgrade.toml.old_version
fi
ln -sv $DIR/dotfiles/_config/topgrade.toml $HOME/.config/topgrade.toml

if [ -e $HOME/.config/starship.toml ]; then
    mv $HOME/.config/starship.toml $HOME/.config/starship.toml.old_version
fi
ln -sv $DIR/dotfiles/_config/starship.toml $HOME/.config/starship.toml
