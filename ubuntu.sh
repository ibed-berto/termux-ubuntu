#!/data/data/com.termux/files/usr/bin/bash

time1="$( date +"%r" )"

install1 () {
directory=ubuntuV20-fs
if [ -d "$directory" ];then
first=1
printf "\x1b[38;5;214m[${time1}]\e[0m \e[32;5m[WARNING]:\e[0m \x1b[38;5;87m Lewatkan unduhan dan ekstrak file\n"
elif [ -z "$(command -v proot)" ];then
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;203m[ERROR]:\e[0m \x1b[38;5;87m Proot belum terinstall. Silahkan install proot.\n"
printf "\e[0m"
exit 1
elif [ -z "$(command -v wget)" ];then
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;203m[ERROR]:\e[0m \x1b[38;5;87m Wget belum terinstall. Silahkan install wget.\n"
printf "\e[0m"
exit 1
fi
if [ "$first" != 1 ];then
if [ -f "ubuntu.tar.gz" ];then
rm -rf ubuntu.tar.gz
fi
if [ ! -f "ubuntu.tar.gz" ];then
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Sedang mendownload ubuntu rootfs, please wait...\n"
ARCHITECTURE=$(dpkg --print-architecture)
case "$ARCHITECTURE" in
aarch64) ARCHITECTURE=arm64;;
arm) ARCHITECTURE=armhf;;
amd64|x86_64) ARCHITECTURE=amd64;;
*)
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;203m[ERROR]:\e[0m \x1b[38;5;87m Unknown architecture :- $ARCHITECTURE"
exit 1
;;

esac


wget https://github.com/ibed-berto/termux-ubuntu/raw/master/ubuntuV20/focal-${ARCHITECTURE}.tar.gz -q -O ubuntu.tar.gz 
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Download selesai!\n"

fi

cur=`pwd`
mkdir -p $directory
cd $directory
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Decompressing ubuntu rootfs, please wait...\n"
tar -zxf $cur/ubuntu.tar.gz --exclude='dev'||:
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Ubuntu rootfs telah berhasil di decompressed!\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Memperbaiki resolv.conf, Jaga koneksi internet anda\n"
printf "nameserver 8.8.8.8\nnameserver 8.8.4.4\nnameserver 1.1.1.1" > etc/resolv.conf
stubs=()
stubs+=('usr/bin/groups')
for f in ${stubs[@]};do
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Sedang menulis ulang stubs, please wait...\n"
echo -e "#!/bin/sh\nexit" > "$f"
done
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Stubs berhasil di tulis ulang!\n"
cd $cur

fi

mkdir -p ubuntuV20-binds
bin=startubuntu-v20.sh
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Sedang membuat script ulang, please wait...\n"
cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
## uncomment following line if you are having FATAL: kernel too old message.
#command+=" -k 4.14.81"
command+=" --link2symlink"
command+=" -0"
command+=" -r $directory"
if [ -n "\$(ls -A ubuntu-binds)" ]; then
    for f in ubuntu-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sys"
command+=" -b ubuntu-fs/tmp:/dev/shm"
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
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Pembuatan script telah selesai!\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Sedang memperbaiki shebang dari startubuntu.sh, please wait...\n"
termux-fix-shebang $bin
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Perbaikan shebang startubuntu.sh selesai! \n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Pembuatan startubuntu.sh! please wait...\n"
chmod +x $bin
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Pembuatan startubuntu.sh telah berhasil\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Membersihkan berkas tidak di gunakan please wait...\n"
rm ubuntu.tar.gz -rf
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Pembersihan berkas tidak di gunakan selesai!\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Penginstalan ubuntu selesai! Untuk memulai tekan \e[32;5m./startubuntu-v20.sh\n"
printf "\e[0m"

}
if [ "$1" = "-y" ];then
install1
elif [ "$1" = "" ];then
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Apakah anda ingin mengintall Ubuntu? Default Y [Y/n] "

read cmd1
if [ "$cmd1" = "y" ];then
install1
elif [ "$cmd1" = "Y" ];then
install1
else
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;203m[ERROR]:\e[0m \x1b[38;5;87m Penginstalan di batalkan.\n"
printf "\e[0m"
exit
fi
else
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;203m[ERROR]:\e[0m \x1b[38;5;87m Penginstalan di batalkan.\n"
printf "\e[0m"
fi
