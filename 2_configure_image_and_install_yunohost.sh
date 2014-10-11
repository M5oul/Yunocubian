# Put SD card on Cubieboard and turn it on

# Find Cubieboard local IP
nmap box/24

# SSH connection | password = "cubie"
ssh -p 36000 cubie@IP

# Get root | password = "cubie"
sudo -i

# Change hostname
hostname -v yunohost

# Delete Ajenti and his repo
apt-get remove ajenti
nano /etc/apt/sources.list

# Install YunoHost
git clone https://github.com/YunoHost/install_script /tmp/install_script
cd /tmp/install_script && sudo ./install_yunohostv2
# Don’t do postinstallation

# Delete SSH keys
rm -f /etc/ssh/ssh_host_*

# Add script for regenerate SSH key at boot

nano /etc/init.d/ssh_gen_host_keys
---
#!/bin/sh
### BEGIN INIT INFO
# Provides:          Generates new ssh host keys on first boot
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Generates new ssh host keys on first boot
# Description:       Generatesapt-get --purge clean new ssh host keys on $
### END INIT INFO
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -N ""
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -t dsa -N ""
insserv -r /etc/init.d/ssh_gen_host_keys
rm -f \$0
---

chmod a+x /etc/init.d/ssh_gen_host_keys
insserv /etc/init.d/ssh_gen_host_keys

# Upgrade Debian
apt-get update && apt-get dist-upgrade

# Upgrade Cubian
apt-get install cubian-update && cubian-update

# Mouve port 3600 to 22 by commenting line "Port 36000"
# Permit ssh connection with root by switching: PermitRootLogin to "yes"
nano /etc/ssh/sshd_config

# Change rood password to "yunohost"
passwd root

# Quit SSH connection
exit

# Try SSH connection with root
ssh root@IP

# Delete cubie user
userdel cubie

# Delete logs
rm -rf /var/log/*
apt-get --purge clean

# Turn off cubieboard
halt

