#!/bin/bash

cd /tmp/
filename="logmein-hamachi_2.1.0.203-1_amd64.deb"
wget "http://www.vpn.net/installers/$filename"
sudo apt install -y "./$filename"
rm "./$filename"

sleep 3

sudo hamachi login
sudo hamachi set-nick "$USER"

echo "alias hamachi-restart='sudo hamachi logoff; sleep 1; sudo hamachi login;'" >> "$HOME/.bashrc"
# view /etc/init.d/logmein-hamachi start

echo "Dont forget to change nick 'sudo hamachi set-nick ...'"
echo "Reopen terminal to enable hamachi-restart"
