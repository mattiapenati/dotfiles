#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


git clone https://github.com/nodenv/nodenv.git $HOME/.nodenv
pushd ~/.nodenv
    src/configure
    make -C src
popd

mkdir -p $HOME/.nodenv/plugins
git clone https://github.com/nodenv/node-build.git $HOME/.nodenv/plugins/node-build
git clone https://github.com/pine/nodenv-yarn-install.git $HOME/.nodenv/plugins/nodenv-yarn-install"
