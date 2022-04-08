#! /bin/bash

sudo /bin/bash scripts/nfs_pre.sh

sudo docker start r2-dhcp
sudo docker start r2-tftp
sudo docker start r2-nfs-v3
