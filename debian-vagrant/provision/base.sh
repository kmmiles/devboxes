#!/bin/bash -e

aptdir="/downloads/apt"
if [ -d $(dirname "$aptdir") ]; then
  sudo mkdir -p "$aptdir"
  echo "dir::cache::archives $aptdir;" > /tmp/apt.conf
  sudo mv /tmp/apt.conf /etc/apt/apt.conf
fi

sudo apt-get install -y vim git screen

echo "alias ls='ls --color'" > /tmp/bashrc
sudo mv /tmp/bashrc /etc

# dotfiles
git clone https://github.com/kmmiles/dotfiles.git
cd dotfiles && chmod +x copy.sh
sudo -H -u vagrant ./copy.sh
cd .. && rm -rf dotfiles
