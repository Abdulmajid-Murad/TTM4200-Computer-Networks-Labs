#!/bin/bash
VAR=$(ip a | grep 10.20.50.100 | sed 's/.*\(eth*\)/\1/'); ip link set $VAR down; ip link set $VAR name ether0; ip link set ether0 up
VAR=$(ip a | grep 129.168.1.18 | sed 's/.*\(eth*\)/\1/'); ip link set $VAR down; ip link set $VAR name ether1; ip link set ether1 up

ip route del 0/0
ip route add default via 129.168.1.19

iptables -t nat -A POSTROUTING -o ether1 -j MASQUERADE
iptables -A FORWARD -i ether1 -o ether0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i ether0 -o ether1 -j ACCEPT

macchanger -r ether0
source ~/.bashrc

dpkg-reconfigure openssh-server
service ssh restart

su -s /bin/bash ttm4200





