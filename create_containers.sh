#! /bin/bash

source roach2_netboot.sh

docker-compose -f dhcp_nfs_tftp.yml config > tmp.yml

sudo docker-compose -f tmp.yml up -d

rm tmp.yml
