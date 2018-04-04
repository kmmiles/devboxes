#!/bin/bash -e

google-chrome --version > /dev/null 2>&1 && exit 0

echo "installing chrome..."

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo yum -y install redhat-lsb libXScrnSaver
sudo yum -y localinstall google-chrome-stable_current_x86_64.rpm
