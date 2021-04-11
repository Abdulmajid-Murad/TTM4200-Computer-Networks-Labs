#!/bin/bash

echo "Saving iptables....."
iptables-save > /etc/iptables.conf

if [ -f "/etc/iptables.conf" ]; then
    cp --backup=t /etc/iptables.conf /home/ttm4200/work_dir/config_files/etc/iptables.conf
fi
chmod -R a+rwx /home/ttm4200/work_dir/config_files/
