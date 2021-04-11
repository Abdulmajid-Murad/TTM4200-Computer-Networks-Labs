#!/bin/bash

echo "Saving iptables....."
iptables-save > /etc/iptables.conf

if [ -f "/etc/iptables.conf" ]; then
    cp --backup=t /etc/iptables.conf /home/ttm4200/work_dir/config_files/etc/iptables.conf
fi
chmod -R a+rwx /home/ttm4200/work_dir/config_files/

if [ -f "/etc/wireguard/wg0.conf" ]; then
    cp /etc/wireguard/wg0.conf /home/ttm4200/work_dir/config_files/etc/wireguard/wg0.conf
fi