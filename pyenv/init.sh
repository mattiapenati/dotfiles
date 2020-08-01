#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv

mkdir -p $HOME/.pyenv/plugins
git clone https://github.com/pyenv/pyenv-doctor.git $HOME/.pyenv/plugins/pyenv-doctor
git clone https://github.com/pyenv/pyenv-update.git $HOME/.pyenv/plugins/pyenv-update
git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

if [[ -z ${ZSH_CUSTOM+x} ]]; then
    mkdir -p $ZSH_CUSTOM/plugins/poetry
    poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
fi
