# Put SD card on Cubieboard and turn it on

# Find Cubieboard local IP
nmap box/24

# SSH connection | password = "cubie"
ssh -p 36000 cubie@IP

# Mouve port 3600 to 22 on /etc/ssh/sshd_config: comment port 36000
# Permit root ssh connection: /etc/ssh/sshd_config: PermitRootLogin yes
# Change rood password to "yunohost"
sudo passwd root
# Delete cubie user
userdel cubie
# Change hostname
hostname -v yunohost
# Delete Ajenti and his repo
sudo apt-get remove ajenti
# /etc/apt/sources.list

# Quit SSH connection
exit
# Connect SSH with root
ssh root@IP

# Install YunoHost
sudo apt-get install git
git clone https://github.com/YunoHost/install_script /tmp/install_script
cd /tmp/install_script && sudo ./install_yunohostv2
# Don’t do postinstallation

# Delete SSH keys
rm -f /etc/ssh/ssh_host_*

# Add script for regenerate SSH key regenerate at boot
echo "#!/bin/sh
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
rm -f \$0" > /etc/init.d/ssh_gen_host_keys

chmod a+x /etc/init.d/ssh_gen_host_keys
insserv /etc/init.d/ssh_gen_host_keys

# Upgrade Debian
apt-get update && apt-get dist-upgrade
# Upgrade Cubian
apt-get install cubian-update && cubian-update
# Delete logs
rm -rf /var/log/*
apt-get --purge clean
# Turn off cubieboard
halt

