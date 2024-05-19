#!/bin/bash
#
# Stop, Remove, rebuild & run your Ansible container after making changes
# Requires a containerlab topology to be deployed as it creates the
# management network namespace

git pull # Comment this out if working locally

sudo docker stop $(sudo docker ps -qaf name=cc-server-ansible)
sudo docker rm $(sudo docker ps -qaf name=cc-server-ansible)
sudo docker build -t cc-ansible .
sudo docker image rm $(sudo docker image list -qf dangling=true)
sudo docker run --net management --ip 172.20.0.10 -d --name cc-server-ansible cc-ansible