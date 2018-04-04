#!/bin/bash -e

if ! docker > /dev/null 2>&1; then
  echo "ERROR: docker not installed"
  exit 1
fi

if ! /usr/local/bin/kubectl > /dev/null 2>&1; then
  echo "installing kubectl..."
  cd /Downloads
  curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  chmod +x kubectl 
  sudo mv ./kubectl /usr/local/bin/
fi
