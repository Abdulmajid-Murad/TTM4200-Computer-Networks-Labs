#!/bin/bash

echo "Saving DHCP configuration....."

cp --backup=t /etc/dhcp/dhcpd.conf /home/ttm4200/work_dir/config_files/etc/dhcp/dhcpd.conf
cp --backup=t /etc/default/isc-dhcp-server /home/ttm4200/work_dir/config_files/etc/default/isc-dhcp-server

echo "Saving iptables....."
iptables-save > /etc/iptables.conf

if [ -f "/etc/iptables.conf" ]; then
    cp --backup=t /etc/iptables.conf /home/ttm4200/work_dir/config_files/etc/iptables.conf
fi





