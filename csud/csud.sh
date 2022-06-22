#!/bin/bash

path=$(realpath $BASH_SOURCE)
path=$(dirname "$path")/..

if [ "$1" == 'install' ]
then
    if [ -d "$path/packages/$2" ]
    then
        if grep -q "$2" "$path/csud/.local/installed-packages.txt"
        then
            echo "Already installed $2"
        else
            echo "$2" >> "$path/csud/.local/installed-packages.txt"
            bash "$path/packages/$2/install.sh"
            echo "Installed $2 !"
        fi
    else
        echo "BAD PACKAGE NAME : $path/packages/$2"
    fi
fi

if [ "$1" == 'remove' ]
then
    if [ -d "$path/packages/$2" ]
    then
        if ! grep -q "$2" "$path/csud/.local/installed-packages.txt"
        then
            echo "Already remove $2"
        else
            sed "/$2/d" "$path/csud/.local/installed-packages.txt" > tmp.txt && mv tmp.txt "$path/csud/.local/installed-packages.txt"
            bash "$path/packages/$2/remove.sh"
            echo "Removed $2 !"
        fi
    else
        echo "BAD PACKAGE NAME : $path/packages/$2"
    fi
fi

if [ "$1" == 'list' ]
then
    cat "$path/csud/.local/installed-packages.txt"
fi

if [ "$1" == 'all' ]
then
    cd "$path/packages/"
    for i in $(ls -d */); do echo ${i%%/}; done
fi
