#!/bin/sh
set -eu
IFS=$'\n\t'


cargo install \
    cargo-edit \
    cargo-update \
    hyperfine \
    taplo-cli

cargo install --no-default-features \
    sccache
