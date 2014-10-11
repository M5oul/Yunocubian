#!/bin/bash

### Creation of YunoHost images for Cubieboard 1 & 2  ###

# Download Cubian images on http://cubian.org/

# Comment first line if Cubie1 and uncomment second
CUBIAN_IMG_PATH=./Cubian-nano+headless-x1-a20.img
#CUBIAN_IMG_PATH=./Cubian-nano+headless-x1-a10.img
#Check SD card path
SD_DRIVE=/dev/sdd1

# Copy cubian image cubian on SD card
mount SD_DRIVE
sudo dd bs=1M if=CUBIAN_IMG_PATH of=SD_DRIVE; sync
umount SD_DRIVE

