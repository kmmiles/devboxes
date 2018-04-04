#!/bin/bash -e

# install minimum packages
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install vim screen epel-release openssl-devel 

# cache yum downloads on host machine
sudo sed -i 's/\/var\/cache/\/Downloads/g' /etc/yum.conf

# disable selinux
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# install my dotfiles
git clone https://github.com/kmmiles/dotfiles.git
cd dotfiles && chmod +x copy.sh
sudo -H -u vagrant ./copy.sh
cd .. && rm -rf dotfiles
