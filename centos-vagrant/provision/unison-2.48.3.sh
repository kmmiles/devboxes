#!/bin/bash -e

BUILDDIR="/tmp/unison-build"
[ -d "$BUILDDIR" ] && rm -rf "$BUILDDIR"
mkdir -p "$BUILDDIR" && pushd "$BUILDDIR"

curl -LO https://github.com/fongandrew/vagrant-boilerplate/raw/master/provisioning/unison-2.48.3-2-x86_64.pkg.tar.xz
sudo tar xf unison-2.48.3-2-x86_64.pkg.tar.xz -C /
rm -rf "$BUILDDIR"
