#!/bin/sh
set -eu
IFS=$'\n\t'

RUSTC_WRAPPER="" cargo install \
  cargo-binstall

RUSTC_WRAPPER="" cargo binstall -y \
  sccache

cargo binstall -y \
  bat \
  cargo-edit \
  cargo-nextest \
  cargo-update \
  fd-find \
  git-delta \
  git-interactive-rebase-tool \
  hyperfine \
  ripgrep \
  starship \
  taplo-cli \
  topgrade
