#!/bin/sh
set -eu
IFS=$'\n\t'

nvim --headless "+Lazy! sync" +qa
