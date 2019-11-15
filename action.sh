#!/usr/bin/env bash

set -eu
export ASDF_DATA_DIR=/root/.asdf
VERSION=$1

$ASDF_DATA_DIR/bin/asdf install gleam $VERSION

env

echo
echo
echo $GITHUB_WORKSPACE
ls $GITHUB_WORKSPACE

cp -v $ASDF_DATA_DIR/installs/gleam/$VERSION/bin/gleam /usr/local/bin/gleam
ls /usr/local/bin
