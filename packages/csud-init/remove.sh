#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..

special_path=$(echo $path | sed 's/\//\\\//g')
sed "/alias csud='$special_path\/csud\/csud.sh'/d" "$HOME/.bashrc" > tmp.txt && mv tmp.txt "$HOME/.bashrc"
