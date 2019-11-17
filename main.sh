#!/usr/bin/env bash

set -eu
export ZSH_VERSION=""
export ASDF_DATA_DIR=$(mktemp -d)

VERSION=$1

# Install asdf
echo Installing sandboxed asdf version manager
git \
  -c advice.detachedHead=false \
  clone https://github.com/asdf-vm/asdf.git $ASDF_DATA_DIR \
  --depth 1 \
  --branch v0.7.5
source $ASDF_DATA_DIR/asdf.sh

# Install asdf Gleam support
echo Installing asdf Gleam plugin
asdf plugin-add gleam https://github.com/vic/asdf-gleam.git

# Install Gleam
echo Downloading Gleam $VERSION
asdf install gleam $VERSION

# Move Gleam binary onto path
echo Installing Gleam to /usr/local/bin/gleam
sudo cp -v $ASDF_DATA_DIR/installs/gleam/$VERSION/bin/gleam /usr/local/bin/gleam

# Cleanup
echo Removing sandboxed asdf
rm -fr $ASDF_DATA_DIR
