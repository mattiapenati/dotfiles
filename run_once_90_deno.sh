#!/bin/sh
set -eu
IFS=$'\n\t'

if test -r ~/.deno/bin/deno; then
  echo "Deno already installed"
else
  echo "Installing Deno"
  curl -fsSL https://deno.land/x/install/install.sh | sh
fi
