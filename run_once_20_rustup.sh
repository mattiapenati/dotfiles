#!/bin/sh
set -eu
IFS=$'\n\t'

if test -r ~/.cargo/bin/rustup; then
  echo "Rust Toolchain already installed"
else
  echo "Installing Rust Toolchain"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --verbose -y
fi
