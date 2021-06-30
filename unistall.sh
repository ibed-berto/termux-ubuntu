#!/data/data/com.termux/files/usr/bin/bash

echo "Starting to uninstall, please be patient..."

versi=ubuntuV20
chmod 777 -R ${versi}-fs
rm -rf ${versi}-fs
rm -rf ${versi}-binds
rm -rf {versi}.sh
rm -rf startubuntu-v20.sh
rm -rf de-apt-xfce4.sh
rm -rf de-apt-mate.sh
rm -rf de-apt-lxqt.sh
rm -rf de-apt-lxde.sh
rm -rf UNI-ubuntu.sh
rm -rf ${versi}*
echo "Done"
