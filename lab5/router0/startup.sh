#!/bin/bash
VAR=$(ip a | grep 129.100.1.5 | sed 's/.*\(eth*\)/\1/'); ip link set $VAR down; ip link set $VAR name ether0; ip link set ether0 up
VAR=$(ip a | grep 129.168.1.2 | sed 's/.*\(eth*\)/\1/'); ip link set $VAR down; ip link set $VAR name ether1; ip link set ether1 up
ip route del 0/0
ip route add default via 129.168.1.3


macchanger -r ether0
echo "nameserver 129.100.1.2" > /etc/resolv.conf
source ~/.bashrc

dpkg-reconfigure openssh-server
service ssh restart

su -s /bin/bash ttm4200





