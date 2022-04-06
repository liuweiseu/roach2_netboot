# ROACH2 NETBOOT

## Descriptions
&ensp; These scripts are used for [roach2](https://casper.astro.berkeley.edu/wiki/ROACH2) netboot, which is based on docker.  
&ensp; Before using the scirpts, make sure docker and docker-compose have been install on your machine. If they are not installed, please follow the instructions here:  
* [docker installation](https://docs.docker.com/engine/install/)
* [docker-compse installation](https://docs.docker.com/compose/install/)
  
## how to use it
1. clone the respiratory
```
    git clone https://github.com/liuweiseu/roach2_netboot.git
```

2. clone roach2_nfs_uboot
```
    git clone https://github.com/ska-sa/roach2_nfs_uboot.git
```

3. Untar debian file system as Root
```
    cd roach2_nfs_uboot
    sudo tar -xzxf roach2-debian-fs-snapshot-24-10-2012.tar.gz
```
&ensp; Now, you should get a new directory named "debian_stable_devel".  

4. go to roach2_netboot and edit netboot_env.sh
&ensp; There are three env parameters in the netboot_env.sh:
* DHCP_PORT: This is the port you connected to roach2 board, which is used for DHCP. 
* TFTP_DIR: This is the directory for tftp files, which should be pointed to "roach2_nfs_uboot/boot"
* NFS_SHARE_DIR: This is the nfs directory, which should be pointed to "roach2_nfs_uboot/debian_stable_devel".

&ensp; ***NOTE:***   
&ensp;&ensp; (1) You need to set an **STATIC IP** address for the port you specified in netboot_env.sh.  
&ensp;&ensp; (2) DHCP IP range is set in ./config/dhcp/dhcpd.conf.  

5. create dhcp, tftp and nfs containers  
&ensp; run the following script for creating contaienrs.
```
    ./create_containers.sh
```

&ensp; ***NOTE:***  
&ensp;&ensp; **DO NOT** use "sudo" here, or docker-compose will not get the env variables you set in netboot_env.sh.  

&ensp;&ensp; <font size=4>Now, you should be able to boot roach2 board up through netboot!</font>


## Delete containers
&ensp; If you don't want to use the containers, you can run the following script to delete them.   
```
    ./del_containers.sh
```
