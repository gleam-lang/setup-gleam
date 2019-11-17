#!/usr/bin/env bash

set -e
VERSION=$1

export ZSH_VERSION=""
export ASDF_DATA_DIR=$(mktemp -d)

# Install asdf
git clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR --depth 1 --branch v0.7.5
source $ASDF_DATA_DIR/asdf.sh

# Install asdf Gleam support
asdf plugin-add gleam https://github.com/vic/asdf-gleam.git@e5ef3d477e384065190bc2c2d147971c98f03bad

# Install Gleam
asdf install gleam $VERSION

# Move Gleam binary onto path
cp -v $ASDF_DATA_DIR/installs/gleam/$VERSION/bin/gleam /usr/local/bin/gleam

# Cleanup
rm -fr $ASDF_DATA_DIR
