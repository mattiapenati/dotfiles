#!/bin/sh
set -eu
IFS=$'\n\t'

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
