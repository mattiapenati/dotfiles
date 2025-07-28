#!/bin/bash
set -eu
IFS=$'\n\t'

case ${OSTYPE:-} in linux*)
  if ! fc-list | grep -qi "AtkynsonMono Nerd Font Mono"; then
    cd /tmp
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/AtkinsonHyperlegibleMono.zip
    unzip AtkinsonHyperlegibleMono.zip -d AtkinsonHyperlegibleMono
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-Light.otf ~/.local/share/fonts
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-LightItalic.otf ~/.local/share/fonts
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-Regular.otf ~/.local/share/fonts
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-Italic.otf ~/.local/share/fonts
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-Medium.otf ~/.local/share/fonts
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-MediumItalic.otf ~/.local/share/fonts
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-Bold.otf ~/.local/share/fonts
    cp AtkinsonHyperlegibleMono/AtkynsonMonoNerdFontMono-BoldItalic.otf ~/.local/share/fonts
    rm -rf AtkinsonHyperlegibleMono.zip AtkinsonHyperlegibleMono
    fc-cache
    cd -
  fi
  ;;
esac
