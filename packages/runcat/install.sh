#!/bin/bash

sudo apt update
sudo apt install -y gnome-tweaks

cd /tmp/
name="runcat@kolesnikov.se.zip"
nameNoExtensions="runcat@kolesnikov.se"
wget "https://github.com/win0err/gnome-runcat/releases/latest/download/$name"
gnome-extensions install "./$name" --force
gnome-extensions enable $nameNoExtensions
rm "./$name"
echo "Please restart GNOME: 'alt + f2' then type 'r'"