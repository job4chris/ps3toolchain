#!/bin/sh
# newlib-1.18.0-PPU.sh by Dan Peori (dan.peori@oopo.net)

## Download the source code.
wget --continue ftp://sources.redhat.com/pub/newlib/newlib-1.18.0.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf newlib-1.18.0 && tar xfvz newlib-1.18.0.tar.gz && cd newlib-1.18.0 || { exit 1; }

## Patch the source code.
cat ../../patches/newlib-1.18.0-PPU.patch | patch -p1 || { exit 1; }

## Create the build directory.
mkdir build-ppu && cd build-ppu || { exit 1; }

## Configure the build.
../configure --prefix="$PS3DEV/ppu" --target="ppu" || { exit 1; }

## Compile and install.
make clean && make -j 4 && make install && make clean || { exit 1; }
