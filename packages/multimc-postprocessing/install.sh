#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/../..


changeMultimcConfigs () {
    configPath="$HOME/.local/share/multimc/multimc.cfg"
    if grep -q $1 $configPath
    then
        lastConfig=$(grep $1 $configPath | sed 's/\//\\\//g')
        argument=$(echo $2 | sed 's/\//\\\//g')
        sed "s/$lastConfig/$1\=$argument/" $configPath > tmpfile.txt && mv tmpfile.txt $configPath
    else
        echo "$1=$2" >> $configPath
    fi
}

changeMultimcConfigs "ApplicationTheme" "dark"
changeMultimcConfigs "MaxMemAlloc" "4096"
# if csud list | grep -q "hdd"
if [ true ]
then
    changeMultimcConfigs "InstanceDir" "$HOME/hdd/games/minecraft/multimc/instances"
    changeMultimcConfigs "CentralModsDir" "$HOME/hdd/games/minecraft/multimc/mods"
fi