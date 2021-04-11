#!/bin/bash

if [ -f "/home/ttm4200/work_dir/config_files/etc/dhcp/dhcpd.conf" ]; then
    cp /home/ttm4200/work_dir/config_files/etc/dhcp/dhcpd.conf  /etc/dhcp/dhcpd.conf
fi

if [ -f "/home/ttm4200/work_dir/config_files/etc/default/isc-dhcp-server" ]; then
    cp /home/ttm4200/work_dir/config_files/etc/default/isc-dhcp-server  /etc/default/isc-dhcp-server
fi

if [ -f "/home/ttm4200/work_dir/config_files/etc/iptables.conf" ]; then
     cp /home/ttm4200/work_dir/config_files/etc/iptables.conf  /etc/iptables.conf
     iptables-restore < /etc/iptables.conf
fi
