#!/bin/bash
sudo docker stop $(sudo docker ps -qaf name=lab_ansible)
sudo docker rm  $(sudo docker ps -qaf name=lab_ansible)
git pull
sudo docker build -t cc-ansible .
sudo docker run -d --name lab_ansible cc-ansible