#!/bin/bash -e

BUILDDIR="/tmp/unison-build"
[ -d "$BUILDDIR" ] && rm -rf "$BUILDDIR"
mkdir -p "$BUILDDIR" && pushd "$BUILDDIR"


curl -LO https://github.com/bcpierce00/unison/releases/download/2.48.4/unison-2.48.4-linux-i386-text-static.tar.gz
tar xvfz unison-2.48.4-linux-i386-text-static.tar.gz
sudo mv unison-2.48.4-linux-i386-text-static /usr/bin/unison

#sudo yum install ocaml ocaml-camlp4-devel ctags ctags-etags -y
#curl -LO https://github.com/bcpierce00/unison/archive/2.48.4.tar.gz
#tar xvfz 2.48.4.tar.gz
#cd unison-2.48.4
#make NATIVE=true
#sudo cp -v src/unison /usr/bin
#sudo cp -v src/unison-fsmonitor /usr/sbin
#sudo cp -v src/fsmonitor.py /usr/sbin

popd
rm -rf "$BUILDDIR"
