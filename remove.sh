#!/bin/bash

echo -n "Apakah anda yakin ingin mengunistall ubuntu ? 
Default Y (Y/N)"

read yes
  if [ $yes = "y" ]||[ $yes = "Y" ];
  then

read -p "
Masukan versi ubuntu yang ingin anda Unistall. 
Ex:20.10 : " V

if [ -f "startubuntu-v${V}.sh" ];
then

echo "
Memulai untuk mengunistall Ubuntu-v${V}"
rm -rf ubuntu${V}-fs
rm -rf ubuntu${V}-binds
rm -rf ubuntu${V}.sh
rm -rf startubuntu*
rm -rf de-apt-xfce4.sh
rm -rf de-apt-mate.sh
rm -rf de-apt-lxqt.sh
rm -rf de-apt-lxde.sh
rm -rf remove.sh
rm -rf ubuntu${V}*
echo "
Unistall ubuntu v${V} selesai"

elif [ ! -f "startubuntu-v${V}.sh" ];
then

rm -rf remove.sh
echo "
Format yang anda masukan salah atau versi ubuntu belum terinstall di perangkat anda."
fi


elif [ $yes = "n" ]||[ $yes = "N" ];
  then
      exit
  else
     echo "
ERROR :
Masukan jawaban yang benar sesuai perintah....!"
     exit
  fi

