#!/bin/bash
#
# Main shell script to manage lab builds, rebuilds and cleanup so I don't have to repeat commands
# This is called from the shell scripts in the labs/xyz directories

usage="Usage: $(basename "$0") function files \n 
EOS example - ./$(basename "$0") clab-ceos-ospf-ceos-r1 eth1"

verbose='false'
action=''
inventory=''
playbook=''
while getopts 'aip:v' flag; do
  case "${flag}" in
    a) action="${OPTARG}" ;;
    i) inventory="${OPTARG}" ;;
    p) playbook="${OPTARG}" ;;
    v) verbose='true' ;;
    *) error "Unexpected option ${flag} \n echo $usage" ;;
  esac
done

# Perform relevant lab action
case "${action}" in
  build)
    if [[-z "$(inventory)" or -z "$(playbook)"]]
      error "-i "$(inventory)" or -p "$(playbook)" flags is not defined in setup script"
    else
      sudo docker build -t cc-ansible ../cc-ansible-core/.
      sudo docker image rm $(sudo docker image list -qf dangling=true)
      sudo docker run -d --name lab_ansible cc-ansible
      sudo docker network connect management $(sudo docker ps -qaf name=lab_ansible)
      sudo docker exec -tu ansible -w /app lab_ansible ansible-playbook -i inventory/"$(inventory)" "$(playbook)" 
    fi
    ;;
  cleanup)
    sudo docker stop $(sudo docker ps -qaf name=lab_ansible)
    sudo docker rm $(sudo docker ps -qaf name=lab_ansible)
    ;;
  *) error "Unexpected action: ${action} used" ;;
esac