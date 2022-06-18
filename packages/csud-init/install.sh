#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..

chmod +x "$path/csud/csud.sh"
echo "alias csud='$path/csud/csud.sh'" >> "$HOME/.bashrc"
