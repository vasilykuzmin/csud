#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/

extensions=$(cat "$path/code-extensions.txt")
for extension in $extensions
do
    code --uninstall-extension $extension
done
