#!/bin/sh
set -eu
IFS=$'\n\t'

if ! command -v cargo-binstall &> /dev/null; then
  echo "Installing cargo-binstall"
  RUSTC_WRAPPER="" \
  cargo install --no-default-features --features static,rustls,git,zstd-thin cargo-binstall
fi

if ! command -v sccache &> /dev/null; then
  echo "Installing sccache"
  cargo binstall -y sccache
fi

if ! command -v topgrade &> /dev/null; then
  echo "Installing topgrade"
  cargo binstall -y topgrade
fi

if ! command -v interactive-rebase-tool &> /dev/null; then
  echo "Installing git-interactive-rebase-tool"
  cargo binstall -y git-interactive-rebase-tool
fi

if ! command -v cargo-update &> /dev/null; then
  echo "Installing cargo-update"
  cargo binstall -y cargo-update
fi

if ! command -v fnm &> /dev/null; then
  echo "Installing fnm"
  cargo-binstall -y fnm
fi

if ! command -v jj &> /dev/null; then
  echo "Installing jujutsu"
  cargo binstall -y --strategies crate-meta-data jj-cli
fi
