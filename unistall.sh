#!/bin/bash

V=20.10
echo "Memulai untuk mengunistall Ubuntu-v${V}"
rm -rf ubuntu${V}-fs
rm -rf ubuntu${V}-binds
rm -rf ubuntu${V}.sh
rm -rf startubuntu-v${V}.sh
rm -rf de-apt-xfce4.sh
rm -rf de-apt-mate.sh
rm -rf de-apt-lxqt.sh
rm -rf de-apt-lxde.sh
rm -rf unistall.sh
rm -rf ubuntu${V}*
echo "Unistall ubuntu v${V} selesai"
