#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..

cd /tmp/

#JAVA 17
sudo apt update
sudo apt install -y libc6-x32 libc6-i386
filename="jdk-17_linux-x64_bin.deb"
wget "https://download.oracle.com/java/17/latest/$filename"
sudo apt install "./$filename"
rm "./$filename"
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-17/bin/java 1

# MultiMC itself
filename="multimc_1.6-1.deb"
wget "https://files.multimc.org/downloads/$filename"
sudo apt install -y "./$filename"
rm -rf "./$filename"
