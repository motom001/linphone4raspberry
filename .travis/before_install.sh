#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

# sudo dpkg --add-architecture i386
# sudo echo "foreign-architecture i386" > /etc/dpkg/dpkg.cfg.d/multiarch
sudo apt-get update -qq
sudo apt-get install -y git rsync cmake

mkdir ~/raspberrypi
mkdir ~/raspberrypi/rootfs
mkdir ~/raspberrypi/tools

git clone https://github.com/raspberrypi/tools.git ~/raspberrypi/tools
cd ~
export PATH=$PATH:$HOME/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
export RASPBIAN_ROOTFS=~/raspberrypi/rootfs

cd ~/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
arm-linux-gnueabihf-gcc -v
