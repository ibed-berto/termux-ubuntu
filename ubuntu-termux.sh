#!/bin/bash


clear
cek=/data/data/com.termux/files

if [ -f "$ada" ] || [ -f "/etc/apt/sources.list" ];
then
echo -e "\x1b[32m\033[1m
Sudah ada ubuntu yang terinstall di perangkat anda.
Silahkan hapus atau install ulang untuk melanjutkan.
"
exit
fi


pkg update && pkg upgrade -y
echo -e "\x1b[32m\033[1mSedang mempersiapkan file pelengkap. "
if [ ! -f "$cek/usr/bin/wget" ] ; then
         echo -e "\x1b[32m\033[1mSedang menginstall wget" && sleep 1
         pkg install wget -y && sleep 1
fi

if [ ! -f "$cek/usr/bin/proot" ] ; then
         echo -e "\x1b[32mSedang menginstall proot " && sleep 1
         pkg install proot -y && sleep 1
fi

CPU=$(dpkg --print-architecture)
case "$CPU" in
aarch64) CPU=arm64;;
arm) CPU=armhf;;
amd64|x86_64) CPU=amd64;;
*)
echo -e "\x1b[32m\033[1m [ERROR]: Architecture tidak terdeteksi :- $CPU"
exit 1
;;

esac

clear
dir=$(pwd)
if [ ! -f "$ada" ] || [ ! -f "/etc/apt/sources.list" ];
then

read -p "Pilih versi ubuntu yang ingin anda install ?
1) Versi 12.04          4) Versi 18.04          7) Versi 21.04
2) Versi 14.04          5) Versi 20.04
3) Versi 16.04          6) Versi 20.10
" versi


clear

if [ "$versi" = "1" ] || [ "$versi" = "12.04" ] || [ "$versi" = "12" ];
then

echo -e "\x1b[32m\033[1mBerikut ini untuk varian ubuntu versi 12.04 : "
echo -e "\x1b[32m\033[1m 
1) Versi 12.04.4

2) Versi 12.04.5
"


read -p "Silahkan masukan jenis varian ubuntu versi 12.04 yang ingin anda install : 
" satu

if  [ "$satu" = "1" ] || [ "$satu" = "12.04.4" ];
then
wget https://cdimage.ubuntu.com/ubuntu-base/releases/12.04/release/ubuntu-base-12.04.4-core-$CPU.tar.gz -q -O ubuntu.tar.gz 
elif [ "$satu"  = "2" ] || [ "satu"  = "12.04.5" ];
then
wget https://cdimage.ubuntu.com/ubuntu-base/releases/12.04/release/ubuntu-base-12.04.5-core-$CPU.tar.gz -q -O ubuntu.tar.gz 
fi
fi

clear

if [ "$versi" = "2" ] || [ "$versi" = "14.04" ] || [ "$versi" = "14" ];
then

echo -e "\x1b[32m\033[1mBerikut ini untuk varian ubuntu versi 14.04 : "
echo -e "\x1b[32m\033[1m 
1) Versi 14.04            4) Versi 14.04.3          7) Versi 14.04.6

2) Versi 14.04.1          5) Versi 14.04.4

3) Versi 14.04.2          6) Versi 14.04.5
"


read -p "Silahkan masukan jenis varian ubuntu versi 14.04 yang ingin anda install : 
" dua

if  [ "$dua" = "1" ] || [ "$dua" = "14.04" ];
then
wget https://cdimage.ubuntu.com/ubuntu-base/releases/14.04/release/ubuntu-base-14.04-core-$CPU.tar.gz -q -O ubuntu.tar.gz
elif [ "$dua"  = "2" ] || [ "$dua"  = "14.04.1" ];
then
wget https://cdimage.ubuntu.com/ubuntu-base/releases/14.04/release/ubuntu-base-14.04.1-core-$CPU.tar.gz -q -O ubuntu.tar.gz 
fi
fi

fi #ada

if [ ! "$versi" = "1" ] || [ ! "$versi" = "20.04.2" ] || [ ! "$versi" = "20.04" ] || [ ! "$versi" = "3" ] || [ ! "$versi" = "21" ] || [ ! "$versi" = "2" ] || [ ! "$versi" = "20.10" ]; 
then
clear
echo "Format yang anda masukan salah. 
Masukan format sesuai pilihan di atas dengan benar. 
"
exit

fi
