#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

apt-get install git rsync cmake ia32-libs

mkdir ~/raspberrypi
mkdir ~/raspberrypi/rootfs
mkdir ~/raspberrypi/tools

echo SET(CMAKE_SYSTEM_NAME Linux) > ~/home/raspberrypi/pi.cmake
echo SET(CMAKE_SYSTEM_VERSION 1) >> ~/home/raspberrypi/pi.cmake
echo SET(CMAKE_C_COMPILER $ENV{HOME}/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-gcc) >> ~/home/raspberrypi/pi.cmake
echo SET(CMAKE_CXX_COMPILER $ENV{HOME}/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++) >> ~/home/raspberrypi/pi.cmake
echo SET(CMAKE_FIND_ROOT_PATH $ENV{HOME}/raspberrypi/rootfs) >> ~/home/raspberrypi/pi.cmake
echo SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER) >> ~/home/raspberrypi/pi.cmake
echo SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY) >> ~/home/raspberrypi/pi.cmake
echo SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY) >> ~/home/raspberrypi/pi.cmake

git clone https://github.com/raspberrypi/tools.git ~/raspberrypi/tools
cd ~
echo export PATH=$PATH:$HOME/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin >> ~/.bashrc
echo export RASPBIAN_ROOTFS=~/raspberrypi/rootfs >> ~/.bashrc
. ~/.bashrc

arm-linux-gnueabihf-gcc -v
