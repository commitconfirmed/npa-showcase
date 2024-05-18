#!/bin/bash
# Build the lab and run ../manage.sh with the relevant playbook / inventory
sudo containerlab deploy
sleep 10 # Give a little bit of time for everything to come up
bash ../manage.sh -a build -i clos.ini -p pb-import-ssh.yml