#!/bin/bash

# Download Cubian images on http://cubian.org/
# Cubian-nano+headless-x1-a20.img
# Cubian-nano+headless-x1-a10.img

# Find path of SD card
df -h

# Copy cubian image on SD card
mount /dev/sdd
sudo dd bs=1M if=Cubian-nano+headless-x1-a20.img of=/dev/sdd; sync
# With GParted create a 512 Mo Swap between /boot and /.
# (If you want to add a swap) note UUID of Swap partition
sudo blkid /dev/sdd3
umount /dev/sdd

