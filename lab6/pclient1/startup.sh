#!/bin/bash
ip route del 0/0
ip route add default via 10.20.40.100
macchanger -r eth0
source ~/.bashrc

dpkg-reconfigure openssh-server
service ssh restart

su -s /bin/bash ttm4200





