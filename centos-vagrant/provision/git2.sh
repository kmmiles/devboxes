#!/bin/bash -e

# check if already installed
if rpm -qa | grep git2u > /dev/null 2>&1; then
  echo "git2 already installed"
  exit 0
fi

# install ius repo if not installed
if ! rpm -qa | grep ius > /dev/null 2>&1; then
  curl --silent --location https://setup.ius.io/ | sudo bash -
fi

# remove git 1 if installed
if rpm -qa | grep git-; then
  echo "removing git 1..."
  sudo yum remove git-* -y
fi

# install git2
sudo yum install git2u -y
