#!/bin/bash
IMG="$1"

sudo qemu-nbd -c /dev/nbd0 "$IMG"
sudo parted -s /dev/nbd0 resizepart 2 100%
sudo e2fsck -f /dev/nbd0p2
sudo resize2fs /dev/nbd0p2

sudo mount /dev/nbd0p2 img
sudo mount /dev/nbd0p1 img/boot

#sudo sed -i 's/^/#/' img/etc/ld.so.preload
#sudo sed -i 's/^/#/' img/etc/ld.so.conf

sudo tee img/etc/udev/rules.d/90-qemu.rules <<EOF
KERNEL=="sda", SYMLINK+="mmcblk0"
KERNEL=="sda?", SYMLINK+="mmcblk0p%n"
KERNEL=="sda2", SYMLINK+="root"
EOF

sudo touch img/boot/ssh

BOOT_UUID=$(sudo blkid --match-tag PARTUUID --output value /dev/nbd0p1)
ROOT_UUID=$(sudo blkid --match-tag PARTUUID --output value /dev/nbd0p2)

sudo sed -i "s#PARTUUID=.* /boot#PARTUUID=$BOOT_UUID /boot#" img/etc/fstab
sudo sed -i "s#PARTUUID=.* / #PARTUUID=$ROOT_UUID / #" img/etc/fstab

sudo umount -R img

sudo qemu-nbd -d /dev/nbd0
