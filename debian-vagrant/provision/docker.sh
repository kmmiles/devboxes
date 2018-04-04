#!/bin/bash

# packages
sudo apt-get update
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# install 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce

# aufs
echo "aufs" > /tmp/aufs.conf
sudo mv /tmp/aufs.conf /etc/modules-load.d/aufs.conf
sudo modprobe aufs
cat << EOF > /tmp/daemon.json
{
  "storage-driver": "aufs"
}
EOF
sudo mv /tmp/daemon.json /etc/docker/daemon.json

# service
sudo systemctl enable docker
sudo service docker restart

# vagrant 
sudo usermod -aG docker vagrant
