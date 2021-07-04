#!/bin/bash


cek=/data/data/com.termux/files
ada="sources.list"
if [ -f "$ada" ] || [ -f "/etc/apt/sources.list" ];
then
echo "
Sudah ada ubuntu yang terinstall di perangkat anda. 
Silahkan hapus atau install ulang untuk melanjutkan. 
"
exit
fi


pkg update && pkg upgrade -y
echo " [ Sedang mempersiapkan file pelengkap. ] "
if [ ! -f "$cek/usr/bin/wget" ] ; then 
         echo -e "\x1b[32m [ Sedang menginstall wget ] " && sleep 1 
         pkg install wget -y && sleep 1
fi

if [ ! -f "$cek/usr/bin/proot" ] ; then 
         echo -e "\x1b[32m [ Sedang menginstall proot ] " && sleep 1 
         pkg install proot -y && sleep 1
fi

clear

if [ ! -f "$ada" ] || [ ! -f "/etc/apt/sources.list" ];
then

read -p "Pilih versi ubuntu yang ingin anda install ?
1) Versi 12.04               4) Versi 18.04               7) Versi 21.04
2) Versi 14.04               5) Versi 20.04
3) Versi 16.04               6) Versi 20.10
" versi
fi

clear 
if [ "$versi" = "1" ] || [ "$versi" = "12.04" ] || [ "$versi" = "12" ];
then

echo -e "\x1b[32m\033[1m [ Berikut ini untuk varian ubuntu versi 12.04 : ]"
echo -e "\x1b[32m\033[1m [ 
1) Versi 12.04.4 
2) Versi 12.04.5 
]
fi

a=".4"
b=".5"
read -p "Silahkan masukan jenis varian ubuntu versi 12.04 yang ingin anda install : " 12.04
if  [ "$12.04" = "1" ] || [ "$12.04" = "12.04.4" ];
then 
echo "11.04"
elif [ "$12.04" = "2" ] || [ "$12.04" = "12.04.05" ];
then 
echo "12.05"
fi


if [ ! "$versi" = "1" ] || [ ! "$versi" = "20.04.2" ] || [ ! "$versi" = "20.04" ] || [ ! "$versi" = "3" ] || [ ! "$versi" = "21" ] || [ ! "$versi" = "2" ] || [ ! "$versi" = "20.10" ]; 
then
clear
echo "Format yang anda masukan salah. 
Masukan format sesuai pilihan di atas dengan benar. 
"
exit

fi
