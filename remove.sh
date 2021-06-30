#!/bin/bash


echo -n "Apakah anda yakin ingin mengunistall ubuntu ? 
Default Y (Y/N)"
read yes
  if [ $yes = "y" ]||[ $yes = "Y" ];
  then

read -p "Masukan versi ubuntu yang ingin anda Unistall. Ex:20.10 : " V

if [ -f "ubuntu${V}-fs" ] || [ -f "ubuntu${V}*" ];
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

if [ ! -f "ubuntu${V}-fs" ] || [ ! -f "ubuntu${V}*" ];
then
echo "Format yang anda masukan salah / versi ubuntu belum terinstall di perangkat anda."
fi
fi

elif [ $yes = "n" ]||[ $yes = "N" ]
  then
      exit
  else
     echo "ERROR : Wrong Input....!"
     echo "\e[0m"
     exit
  fi

