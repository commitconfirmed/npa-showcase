#!/bin/bash
# Build the lab and run ../manage.sh with the relevant playbook / inventory
sudo containerlab deploy 
bash ../manage.sh -a build -i clos.ini -p pb-import-ssh.yml