#!/bin/bash
#
# Build and run the cc-ansible container
# Use rebuild if you are editing the configuration in git.
# Otherwise just ssh/exec in and edit the files locally remembering
# that they won't be saved if you ever rebuild the container!

sudo docker build -t cc-ansible .
sudo docker image rm $(sudo docker image list -qf dangling=true)
sudo docker run --net management --ip 172.20.0.10 -d --name lab_ansible cc-ansible
#sudo docker network connect management $(sudo docker ps -qaf name=lab_ansible)