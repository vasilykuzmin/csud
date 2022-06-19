#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..

savefile="$path/packages/csud-init/.local/.bashrc"
line=$(sed 's/\//\\\//g' "$savefile")
sed "/$line/d" "$HOME/.bashrc" > tmp.txt && mv tmp.txt "$HOME/.bashrc"
rm "$savefile"
