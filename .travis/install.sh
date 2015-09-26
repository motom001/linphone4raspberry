#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

rsync -rl --delete-after --safe-links /{lib,usr} $HOME/raspberrypi/rootfs

cd ~/raspberrypi/rootfs/usr/lib
ln -s arm-linux-gnueabihf/libasound.so
ln -s arm-linux-gnueabihf/libX11.so
ln -s arm-linux-gnueabihf/libXv.so
