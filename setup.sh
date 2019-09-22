#!/bin/bash

./download.sh $1
unzip *${1}*.zip
./convert.sh  *${1}*.img
./prepare.sh  *${1}*.qcow2
