#!/bin/bash -e

VERSION="2.48.3"
URL="http://www.seas.upenn.edu/~bcpierce/unison/download/releases/unison-$VERSION/unison-$VERSION.tar.gz"

BUILDDIR="/tmp/unison-build"
[ -d "$BUILDDIR" ] && rm -rf "$BUILDDIR"
mkdir -p "$BUILDDIR" && pushd "$BUILDDIR"

sudo yum install ocaml ocaml-camlp4-devel ctags ctags-etags -y
curl -LO "$URL"
tar xvfz "unison-$VERSION.tar.gz"
cd "unison-$VERSION"
make NATIVE=true
sudo cp -v unison /usr/bin
sudo cp -v unison-fsmonitor /usr/bin
sudo cp -v fsmonitor.py /usr/bin

popd
rm -rf "$BUILDDIR"
