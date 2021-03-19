#!/bin/sh
set -eu
IFS=$'\n\t'


[ -d ~/.pyenv ] || \
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

mkdir -p ~/.pyenv/plugins

[ -d ~/.pyenv/plugins/pyenv-doctor ] || \
    git clone https://github.com/pyenv/pyenv-doctor.git ~/.pyenv/plugins/pyenv-doctor
[ -d ~/.pyenv/plugins/pyenv-update ] || \
    git clone https://github.com/pyenv/pyenv-update.git ~/.pyenv/plugins/pyenv-update
[ -d ~/.pyenv/plugins/pyenv-virtualenv ] || \
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
