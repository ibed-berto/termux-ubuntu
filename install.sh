#!/bin/bash

pkg update && pkg upgrade -y
pkg install proot -y
pkg install wget -y
clear

read -p "Masukan versi ubuntu yang ingin anda install ?

1) v20.04.2

2) v20.10

3) v21

" versi
if [ "$versi" = "1" ] || [ "$versi" = "20.04.2" ] || [ "$versi" = "20.04" ];
then

wget https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu-v20.04.sh && chmod +x ubuntu-v20.04.sh && ./ubuntu-v20.04.sh

elif [ "$versi" = "2" ] || [ "$versi" = "20.10" ];
then

wget https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu-v20.10.sh && chmod +x ubuntu-v20.10.sh && ./ubuntu-v20.10.sh

elif [ "$versi" = "3" ] || [ "$versi" = "21" ];
then

wget https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu-v21.sh && chmod +x ubuntu-v21.sh && ./ubuntu-v21.sh

fi

if [ ! "$versi" = "1" ] || [ ! "$versi" = "20.04.2" ] || [ ! "$versi" = "20.04" ] || [ ! "$versi" = "3" ] || [ ! "$versi" = "21" ] || [ ! "$versi" = "2" ] || [ ! "$versi" = "20.10" ]; 
then
clear
exi
echo "Anda salah memasukan format. Masukan format sesuai pilihan di atas yang benar. "

fi
if [ -f "startubuntu*" ] || [ -f "install.sh" ];
then
rm -rf install.sh
clear
fu
