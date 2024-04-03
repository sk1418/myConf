#!/bin/bash
#first call "out" script to remove domain names in case exits
$HOME/bin/hosts_out.sh

sudo bash -c 'echo "192.168.0.42 akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.42 dl.akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.42 mp3.akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.42 monitoring.akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.42 docker.akcloud.gleeze.com" >> /etc/hosts'
sudo bash -c 'echo "192.168.0.42 git.akcloud.gleeze.com" >> /etc/hosts'

dscacheutil -flushcache
