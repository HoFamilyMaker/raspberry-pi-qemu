#!/bin/bash

IMG="$1"
QCOW="${IMG%img}qcow2"

qemu-img convert -f raw -O qcow2 "$IMG" "$QCOW"
qemu-img resize "$QCOW" +9G
