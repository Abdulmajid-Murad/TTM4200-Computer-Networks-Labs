#!/bin/bash
sh /home/ttm4200/work_dir/restore.sh
VAR=$(ip a | grep 10.20.30.100 | sed 's/.*\(eth*\)/\1/'); ip link set $VAR down; ip link set $VAR name ether0; ip link set ether0 up
VAR=$(ip a | grep 129.168.1.2 | sed 's/.*\(eth*\)/\1/'); ip link set $VAR down; ip link set $VAR name ether1; ip link set ether1 up

macchanger -r ether0

ip route del 0/0
ip route add default via 129.168.1.3

source ~/.bashrc

dpkg-reconfigure openssh-server
service ssh restart

su -s /bin/bash ttm4200
