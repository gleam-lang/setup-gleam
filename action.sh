#!/usr/bin/env bash

set -eu
export ASDF_DATA_DIR=/root/.asdf
VERSION=$1

$ASDF_DATA_DIR/bin/asdf install gleam $VERSION

echo $GITHUB_WORKSPACE
ls $GITHUB_WORKSPACE

echo "::add-path::$ASDF_DATA_DIR/installs/gleam/$VERSION/bin/"
