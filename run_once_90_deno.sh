#!/bin/sh
set -eu
IFS=$'\n\t'

curl -fsSL https://deno.land/x/install/install.sh | sh
