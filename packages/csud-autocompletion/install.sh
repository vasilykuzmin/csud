#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..

chmod +x "$path/packages/csud-autocompletion/csud-autocompletion.sh"
echo ". $path/packages/csud-autocompletion/csud-autocompletion.sh" >> "$HOME/.bashrc"
echo "Reset your terminal to enable autocompletion"
