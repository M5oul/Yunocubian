#!/bin/bash

# Change date name file

# Copy /boot and / partitions to PC - create image
sudo dd bs=1M if=/dev/sdd of=yunohost-cubieboard-a20-2014-10-14.img

### Try image
# Copy image to sd card
sudo dd bs=1M if=yunohost-cubieboard-a20-2014-10-14.img of=/dev/sdd

# Check file system with GParted
# Increase root (/) partition size image to max size

# Put SD card on cubieboard and turn it on
# Proceed to postinstallation of YunoHost

# If everything is all right, go next

# Create a zip of the image to upload it
zip yunohost-cubieboard-a20-2014-10-14.img.zip yunohost-cubieboard-a20-2014-10-14.img

# Create a torrent

