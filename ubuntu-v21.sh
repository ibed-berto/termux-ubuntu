#!/data/data/com.termux/files/usr/bin/bash

time1="$( date +"%r" )"

install1 () {
directory=ubuntu21.04-fs
version=21.04
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


wget http://cdimage.ubuntu.com/ubuntu-base/releases/${version}/release/ubuntu-base-${version}-base-${ARCHITECTURE}.tar.gz -q -O ubuntu.tar.gz 
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Download selesai!\n"

fi

cur=`pwd`
mkdir -p $directory
cd $directory
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Decompressing ubuntu rootfs, please wait...\n"
tar -zxf $cur/ubuntu.tar.gz --exclude='dev'||:
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;83m[Installer thread/INFO]:\e[0m \x1b[38;5;87m Ubuntu rootfs telah berhasil di decompressed!\n"
cd $cur

fi

mkdir -p ubuntu${version}-binds
mkdir -p ${directory}/proc/fakethings

if [ ! -f "${cur}/${directory}/proc/fakethings/stat" ]; then
	cat <<- EOF > "${cur}/${directory}/proc/fakethings/stat"
	cpu  5502487 1417100 4379831 62829678 354709 539972 363929 0 0 0
	cpu0 611411 171363 667442 7404799 61301 253898 205544 0 0 0
	cpu1 660993 192673 571402 7853047 39647 49434 29179 0 0 0
	cpu2 666965 186509 576296 7853110 39012 48973 26407 0 0 0
	cpu3 657630 183343 573805 7863627 38895 48768 26636 0 0 0
	cpu4 620516 161440 594973 7899146 39438 47605 26467 0 0 0
	cpu5 610849 155665 594684 7912479 40258 46870 26044 0 0 0
	cpu6 857685 92294 387182 8096756 46609 22110 12364 0 0 0
	cpu7 816434 273809 414043 7946709 49546 22311 11284 0 0 0
	intr 601715486 0 0 0 0 70612466 0 2949552 0 93228 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12862684 625329 10382717 16209 55315 8510 0 0 0 0 11 11 13 270 192 40694 95 7 0 0 0 36850 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 286 6378 0 0 0 54 0 3239423 2575191 82725 0 0 127 0 0 0 1791277 850609 20 9076504 0 301 0 0 0 0 0 3834621 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 806645 0 0 0 0 0 7243 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2445850 52 1783 0 0 5091520 0 0 0 3 0 0 0 0 0 5475 0 198001 0 2 42 1289224 0 2 202483 4 0 8390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3563336 4202122 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0 1 0 0 1 0 1 0 17948 0 0 612 0 0 0 0 2103 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 10 0 0 0 0 0 0 0 11 11 12 0 12 0 52 752 0 0 0 0 0 0 0 743 0 14 0 0 12 0 0 1863 229 0 464 0 0 0 0 0 0 8588 97 7236426 92766 622 31 0 0 0 18 4 4 0 5 0 0 116013 7 0 0 752406
	ctxt 826091808
	btime 1611513513
	processes 288493
	procs_running 1
	procs_blocked 0
	softirq 175407567 14659158 51739474 28359 5901272 8879590 0 11988166 46104015 0 36107533
	EOF
fi


if [ ! -f "${cur}/${directory}/proc/fakethings/version" ]; then
	cat <<- EOF > "${cur}/${directory}/proc/fakethings/version"
	Ubuntu version 20.04 (ibed-berto) (Made by = "https://github.com/ibed-berto"(Ibed-berto /proc/version) ) 
	EOF
fi

if [ ! -f "${cur}/${directory}/proc/fakethings/vmstat" ]; then
	cat <<- EOF > "${cur}/${directory}/proc/fakethings/vmstat"
	nr_free_pages 15717
	nr_zone_inactive_anon 87325
	nr_zone_active_anon 259521
	nr_zone_inactive_file 95508
	nr_zone_active_file 57839
	nr_zone_unevictable 58867
	nr_zone_write_pending 0
	nr_mlock 58867
	nr_page_table_pages 24569
	nr_kernel_stack 49552
	nr_bounce 0
	nr_zspages 80896
	nr_free_cma 0
	nr_inactive_anon 87325
	nr_active_anon 259521
	nr_inactive_file 95508
	nr_active_file 57839
	nr_unevictable 58867
	nr_slab_reclaimable 17709
	nr_slab_unreclaimable 47418
	nr_isolated_anon 0
	nr_isolated_file 0
	workingset_refault 33002180
	workingset_activate 5498395
	workingset_restore 2354202
	workingset_nodereclaim 140006
	nr_anon_pages 344014
	nr_mapped 193745
	nr_file_pages 218441
	nr_dirty 0
	nr_writeback 0
	nr_writeback_temp 0
	nr_shmem 1880
	nr_shmem_hugepages 0
	nr_shmem_pmdmapped 0
	nr_anon_transparent_hugepages 0
	nr_unstable 0
	nr_vmscan_write 8904094
	nr_vmscan_immediate_reclaim 139732
	nr_dirtied 8470080
	nr_written 16835370
	nr_indirectly_reclaimable 8273152
	nr_unreclaimable_pages 130861
	nr_dirty_threshold 31217
	nr_dirty_background_threshold 15589
	pgpgin 198399484
	pgpgout 31742368
	pgpgoutclean 45542744
	pswpin 3843200
	pswpout 8903884
	pgalloc_dma 192884869
	pgalloc_normal 190990320
	pgalloc_movable 0
	allocstall_dma 0
	allocstall_normal 3197
	allocstall_movable 1493
	pgskip_dma 0
	pgskip_normal 0
	pgskip_movable 0
	pgfree 384653565
	pgactivate 34249517
	pgdeactivate 44271435
	pglazyfree 192
	pgfault 46133667
	pgmajfault 5568301
	pglazyfreed 0
	pgrefill 55909145
	pgsteal_kswapd 58467386
	pgsteal_direct 255950
	pgscan_kswapd 86628315
	pgscan_direct 415889
	pgscan_direct_throttle 0
	pginodesteal 18
	slabs_scanned 31242197
	kswapd_inodesteal 1238474
	kswapd_low_wmark_hit_quickly 11637
	kswapd_high_wmark_hit_quickly 5411
	pageoutrun 32167
	pgrotated 213328
	drop_pagecache 0
	drop_slab 0
	oom_kill 0
	pgmigrate_success 729722
	pgmigrate_fail 450
	compact_migrate_scanned 43510584
	compact_free_scanned 248175096
	compact_isolated 1494774
	compact_stall 6
	compact_fail 3
	compact_success 3
	compact_daemon_wake 9438
	compact_daemon_migrate_scanned 43502436
	compact_daemon_free_scanned 248107303
	unevictable_pgs_culled 66418
	unevictable_pgs_scanned 0
	unevictable_pgs_rescued 8484
	unevictable_pgs_mlocked 78830
	unevictable_pgs_munlocked 8508
	unevictable_pgs_cleared 11455
	unevictable_pgs_stranded 11455
	swap_ra 0
	swap_ra_hit 7
	speculative_pgfault 221449963
	EOF
fi

bin=startubuntu-v21.sh
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Sedang membuat script ulang, please wait...\n"

cat > $bin <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --kill-on-exit"
command+=" --link2symlink"
command+=" -0"
command+=" -r $directory"
if [ -n "\$(ls -A ubuntu${version}-binds)" ]; then
    for f in ubuntu${version}-binds/* ;do
      . \$f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sys"
command+=" -b /data"
command+=" -b ubuntu${version}-fs/root:/dev/shm"
command+=" -b /proc/self/fd/2:/dev/stderr"
command+=" -b /proc/self/fd/1:/dev/stdout"
command+=" -b /proc/self/fd/0:/dev/stdin"
command+=" -b /dev/urandom:/dev/random"
command+=" -b /proc/self/fd:/dev/fd"
command+=" -b ${cur}/${director}/proc/fakethings/stat:/proc/stat"
command+=" -b ${cur}/${directory}/proc/fakethings/vmstat:/proc/vmstat"
command+=" -b ${cur}/${directory}/proc/fakethings/version:/proc/version"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" MOZ_FAKE_NO_SANDBOX=1"
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


mkdir -p ubuntu${version}-fs/var/tmp
rm -rf ubuntu${version}-fs/usr/local/bin/*

wget -q https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu/.profile -O ubuntu21.04-fs/root/.profile.1
cat $directory/root/.profile.1 >> $directory/root/.profile && rm -rf $director/root/.profile.1
wget -q https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu/vnc -P ubuntu21.04-fs/usr/local/bin
wget -q https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu/vncpasswd -P ubuntu21.04-fs/usr/local/bin
wget -q https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu/vncserver-stop -P ubuntu21.04-fs/usr/local/bin
wget -q https://raw.githubusercontent.com/ibed-berto/termux-ubuntu/main/ubuntu/vncserver-start -P ubuntu21.04-fs/usr/local/bin

chmod +x ubuntu21.04-fs/root/.bash_profile
chmod +x ubuntu21.04-fs/root/.profile
chmod +x ubuntu21.04-fs/usr/local/bin/vnc
chmod +x ubuntu21.04-fs/usr/local/bin/vncpasswd
chmod +x ubuntu21.04-fs/usr/local/bin/vncserver-start
chmod +x ubuntu21.04-fs/usr/local/bin/vncserver-stop
touch $directory/root/.hushlogin
echo "127.0.0.1 localhost localhost" > $directory/etc/hosts
echo "nameserver 1.1.1.1" > $directory/etc/resolv.conf
chmod +x $directory/etc/resolv.conf

printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Pembuatan script telah selesai!\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Sedang memperbaiki shebang. please wait...\n"
termux-fix-shebang $bin
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Perbaikan shebang selesai! \n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Pembuatan file bash! please wait...\n"
chmod +x $bin
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Pembuatan file bash telah berhasil\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Membersihkan berkas tidak di gunakan please wait...\n"
rm ubuntu.tar.gz -rf
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Pembersihan berkas tidak di gunakan selesai!\n"
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Penginstalan ubuntu selesai! Untuk memulai tekan \e[32;5m./startubuntu-v21.sh\n"
rm ubuntu-v21.sh 
printf "\e[0m"

}

if [ "$1" = "-y" ];then
install1
elif [ "$1" = "" ];then
printf "\x1b[38;5;214m[${time1}]\e[0m \x1b[38;5;87m Apakah anda ingin mengintall Ubuntu-V21.04? Default Y [Y/n] "

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
