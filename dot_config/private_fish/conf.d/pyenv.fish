set -x PYENV_ROOT ~/.pyenv

fish_add_path $PYENV_ROOT/bin

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
status is-interactive; and pyenv virtualenv-init - | source
