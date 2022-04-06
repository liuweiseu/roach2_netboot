#! /bin/bash

sudo docker run -itd --name dhcp --init --net host -v "$(pwd)":/data networkboot/dhcpd enp6s0
sudo docker run --name tftp -p 0.0.0.0:69:69/udp -v /home/wei/tftp:/var/tftpboot -itd pghalliday/tftp
