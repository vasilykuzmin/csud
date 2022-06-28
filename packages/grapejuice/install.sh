#!/bin/bash

cd /tmp/

# GRAPEJUICE
# https://brinkervii.gitlab.io/grapejuice/docs/Installing-from-package/Debian-10-and-similar.html
sudo dpkg --add-architecture i386
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl

curl https://gitlab.com/brinkervii/grapejuice/-/raw/master/ci_scripts/signing_keys/public_key.gpg | sudo tee /usr/share/keyrings/grapejuice-archive-keyring.gpg > /dev/null
sudo tee /etc/apt/sources.list.d/grapejuice.list <<< 'deb [signed-by=/usr/share/keyrings/grapejuice-archive-keyring.gpg] https://brinkervii.gitlab.io/grapejuice/repositories/debian/ universal main' > /dev/null
sudo apt update

sudo apt install -y wine
sudo apt install -y grapejuice

# PATCHED WINE
# https://brinkervii.gitlab.io/grapejuice/docs/Guides/Installing-Wine.html
# wget https://pastebin.com/raw/5SeVb005 -O install.py
# python3 install.py

# FIRST RUN INSTALLATION
python3 -m grapejuice first-time-setup


echo "In case of very poor fps try install old gpu drivers"
