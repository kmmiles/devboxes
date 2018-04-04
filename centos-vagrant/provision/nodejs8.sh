#!/bin/bash -e

node -v > /dev/null 2>&1 && exit 0

echo "installing nodejs8..."

curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum install nodejs -y
