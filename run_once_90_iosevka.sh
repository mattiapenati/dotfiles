#!/bin/sh
set -eu
IFS=$'\n\t'

case ${OSTYPE:-} in darwin*)
  workdir=$(mktemp -d)
  trap 'rm -rf -- "$workdir"' EXIT

  pushd $workdir
  git clone --depth=1 --branch "v29.0.4" https://github.com/be5invis/Iosevka.git .
  cat >private-build-plans.toml <<EOF
[buildPlans.iosevka-custom]
family = "Iosevka Custom"
spacing = "term"
serifs = "sans"
noCvSs = true
noLigation = true

[buildPlans.iosevka-custom.weights.regular]
shape = 400
menu = 400
css = 400

[buildPlans.iosevka-custom.weights.bold]
shape = 700
menu = 700
css = 700

[buildPlans.iosevka-custom.widths.normal]
shape = 600
menu = 5
css = "normal"

[buildPlans.iosevka-custom.slopes.upright]
angle = 0
shape = "upright"
menu = "upright"
css = "normal"

[buildPlans.iosevka-custom.slopes.italic]
angle = 9.4
shape = "italic"
menu = "italic"
css = "italic"
EOF

  # docker run --rm -v $(pwd):/build avivace/iosevka-build ttf::iosevka-custom
  brew install ttfautohint
  npm install
  npm run build -- ttf::iosevka-custom
  mkdir -p out
  docker run --rm -v $(pwd)/dist/iosevka-custom/ttf:/in:ro -v $(pwd)/out:/out nerdfonts/patcher --complete --careful --quiet || true
  cp -v out/*.ttf ~/Library/Fonts/
  popd
  rm -rf -- "$workdir"
  ;;
esac
