#!/bin/bash
#
# Stop, Remove, rebuild & run your Ansible container after making changes
# instead of having to restart the whole lab when debugging
# Requires a containerlab topology to be deployed as it creates the
# management network namespace

usage="Usage: $(basename "$0") lab-name \n 
Example to rebuild ansible on the ceos-ixp lab - ./$(basename "$0") ceos-ixp"

if [[ -z $1 ]]; then
  echo $usage
else
  # git pull # Comment this out if working locally
  sudo docker stop $(sudo docker ps -qaf name=clab-$1-serv-ansible)
  sudo docker rm $(sudo docker ps -qaf name=clab-$1-serv-ansible)
  sudo docker build -t cc-ansible .
  sudo docker image rm $(sudo docker image list -qf dangling=true)
  sudo docker run --net management --ip 172.20.0.20 -d --name clab-$1-serv-ansible cc-ansible
fi