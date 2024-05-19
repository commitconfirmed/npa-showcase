#!/bin/bash
#
# Stop, Remove, rebuild & run your Ansible container after making changes
# Requires a containerlab topology to be deployed as it creates the
# management namespace network

git pull # Comment this out if working locally

sudo docker stop $(sudo docker ps -qaf name=lab_ansible)
sudo docker rm $(sudo docker ps -qaf name=lab_ansible)
sudo docker build -t cc-ansible .
sudo docker image rm $(sudo docker image list -qf dangling=true)
sudo docker run --net management --ip 172.20.0.10 -d --name lab_ansible cc-ansible
#sudo docker network connect management $(sudo docker ps -qaf name=lab_ansible)