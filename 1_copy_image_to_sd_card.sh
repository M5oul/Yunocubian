#!/bin/bash

# Download Cubian images on http://cubian.org/

# If Cubieboard 1 comment first line and uncomment second one
CUBIAN_IMG_PATH=./Cubian-nano+headless-x1-a20.img
#CUBIAN_IMG_PATH=./Cubian-nano+headless-x1-a10.img
#Check SD card path
SD_DRIVE=/dev/sdd

# Copy cubian image on SD card
mount SD_DRIVE
sudo dd bs=1M if=CUBIAN_IMG_PATH of=SD_DRIVE; sync
umount SD_DRIVE

