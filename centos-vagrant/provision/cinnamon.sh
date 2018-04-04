#!/bin/bash -e

cinnamon --version > /dev/null 2>&1 && exit 0

echo "installing cinnamon..."
sudo yum --enablerepo=epel -y install cinnamon*
