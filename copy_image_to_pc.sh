#!/bin/bash

# Copy /boot and / partitions to PC - create image
sudo dd bs=1M if=/dev/sdd1 if=/dev/sdd2 of=yunonohost-cubieboard-a20-2014-10-11.img

### Try image
# Copy image to sd card
sudo dd bs=1M if=yunonohost-cubieboard-a20-2014-10-11.img of=/dev/sdd1 of=/dev/sdd2

# Check file system with GParted
# Increase root (/) partition size image to max size

# Put SD card on cubieboard and turn it on
# Proceed to postinstallation of YunoHost

# If everything is all right, go next

# Create a zip of the image to upload it
zip yunonohost-cubieboard-a20-2014-10-11.img.zip yunonohost-cubieboard-a20-2014-10-11.img

# Create a torrent

