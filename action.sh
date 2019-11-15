#!/usr/bin/env sh

set -eu
VERSION=$1

~/.asdf/bin/asdf install gleam $VERSION
cp ~/.asdf/installs/gleam/$VERSION/bin/gleam /usr/local/bin/gleam
