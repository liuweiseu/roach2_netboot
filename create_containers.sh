#! /bin/bash

echo "-----------------Setting env variable-------------------"
# set env variables, which will be used by docker-compose
source netboot_env.sh
echo "NFS_SHARE_DIR=${NFS_SHARE_DIR}"
echo "TFTP_DIR=${TFTP_DIR}"
echo "DHCP_PORT=${DHCP_PORT}"

echo "-----------------Adding kernel moduls--------------------"
# add kernel module for nfs container
sudo /bin/bash scripts/nfs_pre.sh

echo "-------------------Creating Container--------------------"
# create dhcp, nfs and tftp containers through docker-compose 
docker-compose -f ./yml/dhcp-nfs-tftp.yml config > ./yml/tmp.yml
sudo docker-compose -f ./yml/tmp.yml up -d

# delete the tmp file
rm ./yml/tmp.yml
echo "-----------------------All Done!-------------------------"
