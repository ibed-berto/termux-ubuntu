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
      echo "nameserver 8.8.8.8\nnameserver 8.8.4.4\nnameserver 1.1.1.1\n" > etc/resolv.conf
      echo "127.0.0.1 localhost" > etc/hosts
      stubs=()
      stubs+=('usr/bin/groups')
      for f in ${stubs[@]};do
      echo -e "#!/bin/sh\nexit" > "$f"
      done
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
echo -e "\x1b[32m\033[1mPenginstalan ubuntu selesai! Untuk memulai tekan \n\n\e[1;33m./${bin}\n"
rm ubuntu-termux.sh

      }

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

ubuntu=("Versi-12.04" "Versi-14.04" "Versi-16.04" "Versi-18.04" "Versi-20.04" "Versi-20.10" "Versi-21.04")
   echo -e  "\x1b[32m\033[1m\nSilahkan masukan versi ubuntu yang ingin anda install : \n"
   select versi in ${ubuntu[*]}
   do
    
 back=exit
 A=("12.04.4 12.04.5 $back" 
    "14.04.1 14.04.2 14.04.3 14.04.4 14.04.5 14.04.6 14.04 $back" 
    "16.04.1 16.04.2 16.04.3 16.04.4 16.04.5 16.04.6 16.04 $back" 
    "18.04.1 18.04.2 18.04.3 18.04.4 18.04.5 18.04 $back" 
    "20.04.1 20.04.2 $back" "20.10 $back" "21.04 $back" ) 
 vrs=16.04.6
 vrss=18.04.5
 
                    ins () {
                    
                    if [ "$versi" ];
                    then
                    clear
                   echo -e "\x1b[32m\033[1mBerikut ini untuk varian ubuntu $versi : \n"
                    if [ "$versi" = "${ubuntu[0]}" ];
                    then
                    select a in ${A[0]}
                    do
                      if [ "$a" = "$back" ];  #v1
                      then
                      exit
                      elif [ ! "$a" ];
                          then
                          echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                      elif [ "$a" ];
                      then
                      clear 
                      echo -e "\nSedang mengunduh ubuntu versi $a\n"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${a}/release/ubuntu-base-${a}-core-${CPU}.tar.gz" -O $file
                    
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-14.04" ]; #v2
                    then
                    select b in ${A[1]}
                    do
                        if [ "$b" = "$back" ];
                        then
                        exit
                          elif [ ! "$b" ];
                          then
                          echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                        fi 
                        
                       case $b in
                       14.04|14.04.1|14.04.2|14.04.3|14.04.4)
                       clear
                       echo -e "\nSedang mengunduh ubuntu versi $b\n"
                       wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${b}/release/ubuntu-base-${b}-core-${CPU}.tar.gz" -O $file
                       ;;
                       14.04.5|14.04.6)
                       clear
                       echo -e "\nSedang mengunduh ubuntu versi $b\n"
                       wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${b}/release/ubuntu-base-${b}-base-${CPU}.tar.gz" -O $file
                       ;;
                       
                       esac
                     
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-16.04" ]; #v3
                    then
                    select c in ${A[2]}
                    do
                        if [ "$c" = "$back" ];
                        then
                        exit
                         elif [ ! "$c" ];
                         then
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         elif [ "$c" ];
                      then
                      clear
                      echo -e "\nSedang mengunduh ubuntu versi $c\n"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${c}/release/ubuntu-base-${vrs}-base-${CPU}.tar.gz" -O $file
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-18.04" ]; #v4
                    then
                    select d in ${A[3]}
                    do
                        if [ "$d" = "exit" ];
                        then
                        exit 
                         elif [ ! "$d" ];
                         then
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         elif [ "$d" ];
                      then
                      clear
                      echo -e "\nSedang mengunduh ubuntu versi $d\n"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${d}/release/ubuntu-base-${vrss}-base-${CPU}.tar.gz" -O $file
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-20.04" ]; #v5
                    then
                    select e in ${A[4]}
                    do
                        if [ "$e" = "$back" ];
                        then
                        exit
                         elif [ ! "$e" ];
                         then
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         elif [ "$e" ];
                      then
                      clear
                      echo -e "\nSedang mengunduh ubuntu versi $e\n"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${e}/release/ubuntu-base-${e}-base-${CPU}.tar.gz" -O $file
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-20.10" ]; #v6
                    then
                    select f in ${A[5]}
                    do
                        if [ "$f" = "$back" ];
                        then
                        exit
                         elif [ ! "$f" ];
                         then
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         elif [ "$f" ];
                      then
                      clear
                      echo -e "\nSedang mengunduh ubuntu versi $f\n"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${f}/release/ubuntu-base-${f}-base-${CPU}.tar.gz" -O $file
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                    
                    elif [ "$versi" = "Versi-21.04" ]; #v7
                    then
                    select g in ${A[6]}
                    do
                        if [ "$g" = "$back" ];
                        then
                        exit
                         elif [ ! "$g" ];
                         then
                         echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
                         elif [ "$g" ];
                      then
                      clear
                      echo -e "\nSedang mengunduh ubuntu versi $g\n"
                      wget "https://cdimage.ubuntu.com/ubuntu-base/releases/${g}/release/ubuntu-base-${g}-base-${CPU}.tar.gz" -O $file
                      fi
                      if [ -f "ubuntu.tar.gz" ];
                      then
                      extrk
                      exit
                      fi
                    done
                fi
                fi
                }
                
     if [ ! "$versi" = "${ubuntu[*]}" ];
     then
     ins
     echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
     fi
     if [ "$versi" = "${ubuntu[*]}" ];
     then
     clear
     ins                                                                                                  
     echo -e "\nFormat yang anda masukan salah!!! \nMasukan format sesuai pilihan di atas dengan benar."
     fi
     done
