#!/data/data/com.termux/files/usr/bin/bash


clear
cek=/data/data/com.termux/files
dir=$(pwd)
file=ubuntu.tar.gz
folder=ubuntu-fs

if [ "find ubuntu*" ];
then

echo -e "\x1b[32m\033[1mSedang membersihkan file yang dapat menyebabkan kegagalan instalasi.\n"

rm -rf ubuntu*
rm -rf startubuntu*
rm -rf de-apt-xfce4.sh
rm -rf de-apt-mate.sh
rm -rf de-apt-lxqt.sh
rm -rf de-apt-lxde.sh
rm -rf start*

fi

extrk () {
      
      mkdir -p $dir/$folder && cd $dir/$folder
      echo -e "\x1b[32m\033[1mMengekstrak file $file."
      proot --link2symlink tar -xf $dir/$file --exclude='dev'||:
      cd $dir

mkdir -p ubuntu-binds
bin=startubuntu.sh
echo -e "\x1b[32m\033[1mSedang membuat script startubuntu, please wait...\n"


cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r $folder"
if [ -n "\$(ls -A ubuntu-binds)" ]; then
    for f in ubuntu-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sys"
command+=" -b $folder/tmp:/dev/shm"
command+=" -b /data/data/com.termux"
command+=" -b /:/host-rootfs"
command+=" -b /sdcard"
command+=" -b /storage"
command+=" -b /mnt"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="\$@"
if [ -z "\$1" ];then
    exec \$command
else
    \$command -c "\$com"
fi
EOM

echo -e "\x1b[32m\033[1mPenginstalan ubuntu hampir selesai.\n" 
termux-fix-shebang $bin
chmod +x $bin
rm ubuntu.tar.gz -rf
clear
echo -e "\x1b[32m\033[1mPenginstalan ubuntu selesai! Untuk memulai tekan \n\e[32;5m./${bin}\n"
rm ubuntu-v${version}.sh 

      }

#pkg update && pkg upgrade -y
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
ubuntu=("Versi-12.04" "Versi-14.04" "Versi-16.04" "Versi-18.04" "Versi-20.04" "Versi-20.10" "Versi-21.04")
   echo -e  "\x1b[32m\033[1m\nSilahkan masukan versi ubuntu yang ingin anda install : \n"
   select versi in ${ubuntu[*]}
   do
 clear
 
 back=exit
 A=("12.04.4 12.04.5 $back" 
    "14.04.1 14.04.2 14.04.3 14.04.4 14.04.5 14.04.6 14.04 $back" 
    "16.04.1 16.04.2 16.04.3 16.04.4 16.04.5 16.04.6 16.04 $back" 
    "18.04.1 18.04.2 18.04.3 18.04.4 18.04.5 18.04 $back" 
    "20.04.1 20.04.2 $back" "20.10 $back" "21.04 $back" ) 
 vrs=16.04.6
 vrss=18.04.5
 
                   echo -e "\x1b[32m\033[1mBerikut ini untuk varian ubuntu $versi : \n"
                    if [ "$versi" = "${ubuntu[0]}" ];
                    then
                    select a in ${A[0]}
                    do
                      if [ "$a" = "$back" ]; 
                      then
                      exit
                      elif [ ! "$a" ];
                          then
                          clear
                          echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                      elif [ "$a" ];
                      then
                      clear 
                      echo -e "Sedang mengunduh ubuntu versi $a"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${a}/release/ubuntu-base-${a}-core-${CPU}.tar.gz" -O $file
                    
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-14.04" ];
                    then
                    select b in ${A[1]}
                    do
                        if [ "$b" = "$back" ];
                        then
                        exit
                          elif [ ! "$b" ];
                          then
                          clear
                          echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                       elif [ "$b" ];
                       then
                       clear
                      echo -e "Sedang mengunduh ubuntu versi $b"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${b}/release/ubuntu-base-${b}-core-${CPU}.tar.gz" -O $file
....................
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-16.04" ];                                 
                    then
                    select c in ${A[2]}
                    do
                        if [ "$c" = "$back" ];
                        then
                        exit
                         elif [ ! "$c" ];
                         then
                         clear
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         exit
                        fi
                        echo "nama: $vrs "
                    done
                    
                    elif [ "$versi" = "Versi-18.04" ];
                    then
                    select d in ${A[3]}
                    do
                        if [ "$d" = "exit" ];
                        then
                        exit 
                         elif [ ! "$d" ];
                         then
                         clear
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         exit
                        fi
                        echo "nama: $vrss "
                    done
                    
                    elif [ "$versi" = "Versi-20.04" ];
                    then
                    select e in ${A[4]}
                    do
                        if [ "$e" = "$back" ];
                        then
                        exit
                         elif [ ! "$e" ];
                         then
                         clear
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         exit
                        fi
                        echo "nama: $e "
                    done
                    
                    elif [ "$versi" = "Versi-20.10" ];
                    then
                    select f in ${A[5]}
                    do
                        if [ "$f" = "$back" ];
                        then
                        exit
                         elif [ ! "$f" ];
                         then
                         clear
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         exit
                        fi
                        echo "nama: $f "
                    done
                    
                    elif [ "$versi" = "Versi-21.04" ];
                    then
                    select g in ${A[6]}
                    do
                        if [ "$g" = "$back" ];
                        then
                        exit
                         elif [ ! "$g" ];
                         then
                         clear
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         exit
                        fi
                        echo "nama: $g "
                    done

                    fi
      if [ ! "$versi" =  "${ubuntu[*]}" ] ;
      then
      clear
      echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
      exit
      fi
      done
      
    
