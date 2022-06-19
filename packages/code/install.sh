#!/bin/bash

sudo apt update
sudo apt install -y snap
sudo snap refresh snapd
sudo snap install code --classic
