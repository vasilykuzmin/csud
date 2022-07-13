#!/bin/bash

path=$(realpath $BASH_SOURCE)
pacpath=$(dirname "$path")
path=$(dirname "$path")/../..

savefile="/etc/pulse/default.pa"

cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam
sudo ./uninstall

cd /tmp/
rm -rf ./droidcam