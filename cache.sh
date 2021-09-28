#!/usr/bin/env bash

set -eu
export ZSH_VERSION=""
URL=$1

# Install Gleam
echo Downloading Gleam from $URL

wget -q $URL -O "/usr/local/bin/gleam"
chmod +x /usr/local/bin/gleam

echo Done!
