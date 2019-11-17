#!/usr/bin/env bash

set -eu
export ZSH_VERSION=""
export ASDF_DATA_DIR=$(mktemp -d)

VERSION=$1

# Install asdf
git \
  -c advice.detachedHead=false \
  clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR \
  --quiet \
  --depth 1 \
  --branch v0.7.5
source $ASDF_DATA_DIR/asdf.sh

# Install asdf Gleam support
asdf plugin-add gleam https://github.com/vic/asdf-gleam.git

# Install Gleam
asdf install gleam $VERSION

# Move Gleam binary onto path
sudo cp -v $ASDF_DATA_DIR/installs/gleam/$VERSION/bin/gleam /usr/local/bin/gleam

# Cleanup
rm -fr $ASDF_DATA_DIR
