#!/usr/bin/env bash

set -eu
export ASDF_DATA_DIR=/root/.asdf
GLEAM_BIN=$GITHUB_WORKSPACE/gleam-bin/
VERSION=$1

$ASDF_DATA_DIR/bin/asdf install gleam $VERSION

mkdir -pv $GLEAM_BIN
cp -v $ASDF_DATA_DIR/installs/gleam/$VERSION/bin/gleam $GLEAM_BIN
echo "::add-path::$GLEAM_BIN"

echo
ls /

echo
ls /github

echo
ls /github/workspace
