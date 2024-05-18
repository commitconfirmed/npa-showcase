#!/bin/bash
# Stop, Remove, rebuild & run your Ansible container quickly after making changes
# Probably better to do in compose but I'm lazy ;)
sudo containerlab deploy 
sudo docker build -t cc-ansible ../cc-ansible-core/.
sudo docker image rm $(sudo docker image list -qf dangling=true)
sudo docker run -d --name lab_ansible cc-ansible
sudo docker network connect management $(sudo docker ps -qaf name=lab_ansible)
