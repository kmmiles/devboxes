#!/bin/bash -e

# install minimum packages
sudo yum -y groupinstall 'Development Tools'
sudo yum -y install vim screen wget bc cifs-utils epel-release openssl-devel livecd-tools

# cache yum downloads on host machine
sudo sed -i 's/\/var\/cache/\/Downloads/g' /etc/yum.conf

# disable selinux
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

# dotfiles
git clone https://github.com/kmmiles/dotfiles.git
cd dotfiles && chmod +x copy.sh
[ -d /vagrant ] && sudo -H -u vagrant ./copy.sh
[ -d /root ] && sudo ./copy.sh
cd .. && rm -rf dotfiles
