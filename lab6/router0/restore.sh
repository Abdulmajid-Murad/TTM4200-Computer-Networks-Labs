#!/bin/bash

if [ -f "/home/ttm4200/work_dir/config_files/etc/iptables.conf" ]; then
     cp /home/ttm4200/work_dir/config_files/etc/iptables.conf  /etc/iptables.conf
     iptables-restore < /etc/iptables.conf
fi

if [ -f "/home/ttm4200/work_dir/config_files/etc/wireguard/wg0.conf" ]; then
     cp /home/ttm4200/work_dir/config_files/etc/wireguard/wg0.conf /etc/wireguard/wg0.conf
fi
