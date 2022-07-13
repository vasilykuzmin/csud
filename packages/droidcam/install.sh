#!/bin/bash

path=$(realpath $BASH_SOURCE)
pacpath=$(dirname "$path")
path=$(dirname "$path")/../..

# DROIDCAM
cd /tmp/
sudo apt update
sudo apt install -y unzip wget libappindicator3-1 v4l2loopback pulseaudio

wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam
sudo ./install-client
sudo ./install-sound
sudo ./install-video
cd /tmp/
rm -rf ./droidcam

echo "alias droidcam-connect='pacmd load-module module-alsa-source source_properties=device.description=DroidCam device=hw:Loopback,1,0'" >> "$HOME/.bashrc"


# PULSEAUDIO DEFAULTS

changeConfigs () {
    savefile="/etc/pulse/default.pa"
    if grep -q "$1" $savefile
    then
        lastConfig=$(grep "$1" $savefile)
        sed "s/$lastConfig/$2/" $savefile | sudo tee $savefile > /dev/null
    else
        echo "$2" | sudo tee $savefile
    fi
}

commentConfig () {
    savefile="/etc/pulse/default.pa"
    if grep -q "$1" $savefile
    then
        lastConfig=$(grep "$1" $savefile)
        if [ ${lastConfig::1} != '#' ]
        then
            sed "s/$lastConfig/# $1/" $savefile | sudo tee $savefile > /dev/null
        fi
    fi
}

savefile="/etc/pulse/default.pa"

sink=$(pacmd list-sinks | grep "name:" | grep 'pci' | sed '1q' | awk '{print $NF}' | sed 's/^.//;s/.$//')
changeConfigs "set-default-sink" "set-default-sink $sink"
commentConfig "load-module module-stream-restore"
commentConfig "load-module module-switch-on-connect"
