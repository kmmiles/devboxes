#!/bin/bash -e

X -version > /dev/null 2>&1 && exit 0

echo "installing xorg..."
sudo yum -y groups install "Server with GUI"
sudo systemctl isolate graphical.target
sudo systemctl set-default graphical.target
