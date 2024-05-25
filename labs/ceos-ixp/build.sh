#!/bin/bash
#
# Build the lab and run ../manage.sh with the relevant playbook / inventory

sudo containerlab deploy
# Give a little bit of time for everything to come up before running playbooks
echo "Sleeping for 10 seconds..."
sleep 10 
bash ../manage.sh -a deploy -h ceos-ixp-serv-ansible -i ceos-ixp.ini -p pb-import-ssh.yml