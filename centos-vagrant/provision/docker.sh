#!/bin/bash

docker > /dev/null 2>&1 && exit 0

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2 docker

#sudo yum-config-manager \
#    --add-repo \
#    https://download.docker.com/linux/centos/docker-ce.repo
#sudo yum install -y docker-ce docker-compose


cat << EOF > /tmp/docker-storage-setup
DEVS="sdb"
EOF
sudo mv /tmp/docker-storage-setup /etc/sysconfig/
sudo /usr/bin/docker-storage-setup

sudo groupadd docker
sudo usermod -aG docker vagrant

sudo systemctl enable docker
sudo systemctl start docker
