#!/bin/bash
# Install Linux Monitoring Agent on ethOS 1.2.7+
# http://ethosdistro.com/

# Back up default apt sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.orig

# Write repository source to apt sources.list
sudo echo 'deb http://repos.systemmonitor.co.uk/rmmagent/xUbuntu_14.04/ ./' >> /etc/apt/sources.list

# Add the repository key to the list of trusted keys
wget http://repos.systemmonitor.co.uk/rmmagent/xUbuntu_14.04/Release.key
apt-key add Release.key

# Install the Linux Monitoring Agent
sudo apt-get-ubuntu update
sudo apt-get-ubuntu install rmmagent

# Register the Linux Monitoring Agent with the Dashboard
cd /usr/local/rmmagent
# This command will prompt for Dashboard login and walk through registering the server
./rmmagentd -i

# Register rmmagent as a service using update-rc.d to ensure the Linux Monitoring Agent starts after a reboot
sudo update-rc.d rmmagent defaults
find /etc/rc*.d/ -name *rmmagent*|grep rc|sort

echo "Linux Monitoring Agent installation completed"
