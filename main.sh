#!/usr/bin/env bash

set -eu
export ZSH_VERSION=""
export ASDF_DATA_DIR=$(mktemp -d)

VERSION=$1

# Install asdf v0.7.5
git clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR --depth 1 --branch c3ad7e0357816228fb12d761ba7d79729eb040ce
source $ASDF_DATA_DIR/asdf.sh

# Install asdf Gleam plugin
asdf plugin-add gleam https://github.com/vic/asdf-gleam.git --branch e5ef3d477e384065190bc2c2d147971c98f03bad

# Install Gleam
asdf install gleam $VERSION

# Move Gleam binary onto path
cp -v $ASDF_DATA_DIR/installs/gleam/$VERSION/bin/gleam /usr/local/bin/gleam

# Cleanup
rm -fr $ASDF_DATA_DIR
