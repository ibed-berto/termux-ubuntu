#!/bin/bash

read -p "Versi ubuntu berapa yang ingin anda install ?
1) v20.04.2
2) v20.10
3) v21 " versi
if [ "$versi" = "1" ];
then

wget https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu-v20.04.2.sh && chmod +x ubuntu-v20.04.2.sh && ./ubuntu-v20.04.2.sh

else [ "$versi" = "2" ];
then

wget https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu-v20.10.sh && chmod +x ubuntu-v20.04.2.sh && ./ubuntu-v20.04.2.sh

else [ "$versi" = "3" ];
then

wget https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu-v21.sh && chmod +x ubuntu-v20.04.2.sh && ./ubuntu-v20.04.2.sh

fi
