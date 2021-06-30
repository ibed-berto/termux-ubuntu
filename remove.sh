#!/bin/bash

unistall="y"
while [ $unistall = "y" ]
do
echo -n "Apakah anda yakin ingin mengunistall ubuntu ? Default Y (Y/N)\n"
read yes;
  if [ $yes = "y" ]||[ $yes = "Y" ]
  then
V="Masukan Versi ubuntu yang ingin anda Unistall. Ex :20.10 :"
read -p "$V" versi
if [ "${versi}" = "${versi}" ];
then

echo "Memulai untuk mengunistall Ubuntu-v${V}"
rm -rf ubuntu${V}-fs
rm -rf ubuntu${V}-binds
rm -rf ubuntu${V}.sh
rm -rf startubuntu*
rm -rf de-apt-xfce4.sh
rm -rf de-apt-mate.sh
rm -rf de-apt-lxqt.sh
rm -rf de-apt-lxde.sh
rm -rf unistall.sh
rm -rf ubuntu${V}*
echo "Unistall ubuntu v${V} selesai"

fi

elif [ $yes = "n" ]||[ $yes = "N" ]
  then
      exit
  else
     echo "ERROR : Wrong Input....!"
     echo "\e[0m"
     exit
  fi

done
