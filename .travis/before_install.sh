#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

# sudo dpkg --add-architecture i386
# sudo echo "foreign-architecture i386" > /etc/dpkg/dpkg.cfg.d/multiarch
sudo apt-get update -qq
sudo apt-get install -y git rsync cmake

mkdir /home/travis/raspberrypi
mkdir /home/travis/raspberrypi/rootfs
mkdir /home/travis/raspberrypi/tools

git clone https://github.com/raspberrypi/tools.git /home/travis/raspberrypi/tools
cd /home/travis
export PATH=$PATH:/home/travis/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
export RASPBIAN_ROOTFS=/home/travis/raspberrypi/rootfs

cd /home/travis/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
arm-linux-gnueabihf-gcc -v
