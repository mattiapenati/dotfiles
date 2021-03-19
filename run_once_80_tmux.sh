#!/bin/sh
set -eu
IFS=$'\n\t'

mkdir -p ~/.tmux/plugins
[ -d ~/.tmux/plugins/tpm ] ||
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
