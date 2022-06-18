#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..

special_path=$(echo $path | sed 's/\//\\\//g')
sed "/. $special_path\/packages\/csud-autocompletion\/csud-autocompletion.sh/d" "$HOME/.bashrc" > tmp.txt && mv tmp.txt "$HOME/.bashrc"
