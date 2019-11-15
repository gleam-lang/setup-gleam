#!/usr/bin/env sh

set -eu
VERSION=$1
ASDF_DATA_DIR=/root/.asdf


$ASDF_DATA_DIR/bin/asdf install gleam $VERSION
cp $ASDF_DATA_DIR/installs/gleam/$VERSION/bin/gleam /usr/local/bin/gleam
