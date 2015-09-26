#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.
set -x # Print commands and their arguments as they are executed.

cd ~/linphone-cmake-builder
python prepare.py python-raspberry
make -C WORK/cmake-python-raspberry
