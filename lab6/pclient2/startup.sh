#!/bin/bash
sh /home/ttm4200/work_dir/restore.sh
ip route del 0/0
ip route add default via 10.20.50.100
macchanger -r eth0


source ~/.bashrc

dpkg-reconfigure openssh-server
service ssh restart

su -s /bin/bash ttm4200





