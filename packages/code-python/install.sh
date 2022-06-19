#!/bin/bash

csud install code

sudo apt update
sudo apt install -y python3 python3-pip

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/

extensions=$(cat "$path/code-extensions.txt")
for extension in $extensions
do
    code --install-extension "$extension"
done
