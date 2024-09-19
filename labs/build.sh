#!/bin/bash
#
# Build the relevant lab and run the ansible playbooks
usage="Usage: $(basename "$0") lab-name \n 
Example to build the ceos-anycast lab - ./$(basename "$0") ceos-anycast"
if [[ -z $1 ]]; then
  echo $usage
else
  # We go into the clab directory so the created clab dir stays in it's relevant lab
  # (Even though we generally clean it up afterwards)
  cd $1
  sudo containerlab deploy 
  # Give a bit of time for the containers to come up before running ansible playbooks
  echo "Sleeping for 10 seconds"
  sleep 10
  cd ..
  sudo docker exec -tu ansible -w /app "clab-$1-serv-ansible" ansible-playbook -i inventory/inventory.yml pb-import-ssh.yml
  sudo docker exec -tu ansible -w /app "clab-$1-serv-ansible" ansible-playbook -i inventory/inventory.yml pb-cfg-lab.yml
fi