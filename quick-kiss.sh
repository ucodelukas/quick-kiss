echo "update and rebuild..."
export CFLAGS="-O3 -pipe -march=native"
export CXXFLAGS="-O3 -pipe -march=native"
export MAKEFLAGS="-j $(nproc)"
kiss u
kiss b

programs="e2fsprogs dosfstools eudev util-linux wpa_supplicant dhcpcd libelf ncurses perl wget grub efibootmgr baseinit git xorg-server xinit xf86-input-libinput sowm liberation-fonts sudo"

kiss b $programs
kiss i $programs

cd /

echo "downloading kernel and firmware..."

kernel="linux-5.5.9"
firmware="linux-firmware-20200122"

wget https://cdn.kernel.org/pub/linux/kernel/v5.x/$kernel.tar.xz
tar xvf $kernel.tar.xz

cd /$kernel



wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/$firmware.tar.gz



cp $firmware/* /usr/lib/firmware/


echo "creating user: kun"


adduser kun
addgroup video
addgroup audio
addgroup wheel

echo ""
echo "DONE"