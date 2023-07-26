#!/bin/bash
#first call "out" script to remove domain names in case exits
$HOME/bin/hosts_out.sh

sudo bash -c 'echo "192.168.0.7 akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.7 dl.akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.7 mp3.akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.7 akpi.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.7 docker.gleeze.com" >> /etc/hosts'

dscacheutil -flushcache
