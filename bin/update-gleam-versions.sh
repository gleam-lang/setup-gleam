#!/usr/bin/env sh

# Code taken from https://github.com/vic/asdf-gleam

FILE=src/gleam-versions.txt

rm $FILE
git ls-remote --tags --refs https://github.com/lpil/gleam "v*" | sed 's;^.*refs/tags/v\(.*\)$;\1;' | grep -vE '^(0.1.0|0.1.1|0.1.2)$' | tac >> $FILE
