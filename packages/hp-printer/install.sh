#!/bin/bash

bash ./remove-all-printers.sh

sudo apt update
sudo apt install -y hplip python3 python3-pyqt5 pyqt5-dev-tools

hp-setup

defaultPrinter=$(lpstat -p | awk '{print $2}' | sed '1q')

lpadmin -d $defaultPrinter
