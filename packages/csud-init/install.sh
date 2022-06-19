#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..

chmod +x "$path/csud/csud.sh"
chmod +x "$path/csud/bin/csud"

savefile="$path/packages/csud-init/.local/bashrc"

echo "export PATH=$PATH:$path/csud/bin" > "$savefile"
cat "$savefile" >> "$HOME/.bashrc"
