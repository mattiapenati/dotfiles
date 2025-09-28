#!/bin/sh
set -eu
IFS=$'\n\t'

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
mkdir -p "$(dirname $ZINIT_HOME)"
[ -d $ZINIT_HOME ] ||
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
