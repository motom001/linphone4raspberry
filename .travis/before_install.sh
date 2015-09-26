#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

# sudo dpkg --add-architecture i386
# sudo echo "foreign-architecture i386" > /etc/dpkg/dpkg.cfg.d/multiarch
# sudo apt-get update -qq
# sudo apt-get install -y git rsync cmake libc6:i386 libncurses5:i386 libstdc++6:i386

mkdir ~/raspberrypi
mkdir ~/raspberrypi/rootfs
mkdir ~/raspberrypi/tools

echo "SET(CMAKE_SYSTEM_NAME Linux)" > ~/raspberrypi/pi.cmake
echo "SET(CMAKE_SYSTEM_VERSION 1)" >> ~/raspberrypi/pi.cmake
echo "SET(CMAKE_C_COMPILER $ENV{HOME}/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc)" >> ~/raspberrypi/pi.cmake
echo "SET(CMAKE_CXX_COMPILER $ENV{HOME}/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-g++)" >> ~/raspberrypi/pi.cmake
echo "SET(CMAKE_FIND_ROOT_PATH $ENV{HOME}/raspberrypi/rootfs)" >> ~/raspberrypi/pi.cmake
echo "SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)" >> ~/raspberrypi/pi.cmake
echo "SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)" >> ~/raspberrypi/pi.cmake
echo "SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)" >> ~/raspberrypi/pi.cmake

git clone https://github.com/raspberrypi/tools.git ~/raspberrypi/tools
echo "export PATH=$PATH:$HOME/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin" >> ~/.bashrc
echo "export RASPBIAN_ROOTFS=~/raspberrypi/rootfs" >> ~/.bashrc

echo ------------------------------
echo before update $PATH
. ~/.bashrc
echo after update $PATH
echo ------------------------------

~/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc -v
arm-linux-gnueabihf-gcc -v
