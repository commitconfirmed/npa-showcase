#!/bin/bash
#
# Remove the containerlab devices and the ansible container
# Make sure you run this before deploying a different lab

sudo containerlab destroy
# Need to check if "iptables -I FORWARD -i ixp-net -j ACCEPT" also gets removed
sudo docker network rm ixp-net
bash ../manage.sh -a cleanup