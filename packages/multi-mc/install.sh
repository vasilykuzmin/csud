#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..


cd /tmp/
filename="multimc_1.6-1.deb"
wget "https://files.multimc.org/downloads/$filename"
sudo apt install -y "./$filename"
rm -rf "./$filename"
