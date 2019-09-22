#!/bin/bash

qemu-system-arm -kernel kernel-qemu-4.14.79-stretch \
  -cpu arm1176 \
  -m 1024 \
  -M versatilepb \
  -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
  -drive "file=2019-04-08-raspbian-stretch-lite.qcow2,index=0,media=disk,format=qcow2" \
  -nic user,hostfwd=tcp::5022-:22 \
  -no-reboot \
  -nographic \
  -net nic \
  -dtb $(realpath versatile-pb.dtb)
  #-serial stdio
  #-display none \
  #-monitor stdio
  #-M raspi2 \
