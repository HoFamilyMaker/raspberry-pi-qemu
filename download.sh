#!/bin/bash


dl_stretch() {
  wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.14.79-stretch -nc
  wget http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip -nc
}

dl_buster() {
  wget http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-07-12/2019-07-10-raspbian-buster-lite.zip -nc
  wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.19.50-buster -nc
}

case $1 in
  buster) dl_buster
    ;;
  stretch) dl_stretch
    ;;
  *)
    echo "usage: $0 buster|stretch"
    exit 1
    ;;
esac


wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb -nc
