#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

# sudo dpkg --add-architecture i386
# sudo echo "foreign-architecture i386" > /etc/dpkg/dpkg.cfg.d/multiarch
#apt-get update && apt-get upgrade -y
apt-get install -y git rsync cmake

export BASE_PATH=/tmp/linphone4raspberrypi
export RASPBIAN_ROOTFS=$BASE_PATH/rootfs
export PATH=$PATH:$BASE_PATH/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin

mkdir $BASE_PATH
mkdir $BASE_PATH/tools
mkdir $BASE_PATH/rootfs
mkdir $BASE_PATH/rootfs/usr
mkdir $BASE_PATH/rootfs/usr/lib
mkdir $BASE_PATH/linphone-cmake-builder

git clone https://github.com/raspberrypi/tools.git $BASE_PATH/tools
git clone git://git.linphone.org/linphone-cmake-builder.git $BASE_PATH/linphone-cmake-builder
#rsync -rl --delete-after --safe-links /{lib,usr} $BASE_PATH/rootfs

#cd $BASE_PATH/rootfs/usr/lib
#ln -s arm-linux-gnueabihf/libasound.so
#ln -s arm-linux-gnueabihf/libX11.so
#ln -s arm-linux-gnueabihf/libXv.so

cd $BASE_PATH/linphone-cmake-builder

echo ------ Start build ------
echo -- using gcc:   
arm-linux-gnueabihf-gcc -v
echo -- using cmake: 
cmake --version

python prepare.py python-raspberry
make -C WORK/cmake-python-raspberry
