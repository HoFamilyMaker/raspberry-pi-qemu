#!/bin/bash

qemu-system-arm -kernel kernel-qemu-4.19.50-buster \
  -cpu arm1176 \
  -m 256 \
  -M versatilepb \
  -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
  -drive "file=2019-07-10-raspbian-buster-lite.qcow2,index=0,media=disk,format=qcow2" \
  -nic user,hostfwd=tcp::5022-:22 \
  -no-reboot \
  -nographic \
  -net nic \
  -dtb $(realpath versatile-pb.dtb)
  #-serial stdio
  #-display none \
  #-monitor stdio
  #-M raspi2 \
