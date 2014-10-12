#!/bin/bash

# Download Cubian images on http://cubian.org/
# Cubian-nano+headless-x1-a20.img
# Cubian-nano+headless-x1-a10.img

# Copy cubian image on SD card
mount /dev/sdd
sudo dd bs=1M if=Cubian-nano+headless-x1-a20.img of=/dev/sdd; sync
umount /dev/sdd

