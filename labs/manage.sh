#!/bin/bash
#
# Main shell script to manage lab builds, rebuilds and cleanup so I don't have
# to repeat commands. This is called from the shell scripts in the labs/xyz
# directories

verbose='false'
action=''
inventory=''
playbook=''

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

while getopts 'a:h:i:p:v' flag; do
  case "${flag}" in
    a) action="${OPTARG}" ;;
    h) hostname="${OPTARG}" ;; # Ansible hostname changes in each lab
    i) inventory="${OPTARG}" ;;
    p) playbook="${OPTARG}" ;;
    v) verbose='true' ;;
    *) 
      err "Unexpected option "${flag}"" ;;
  esac
done

# Perform relevant lab action
# Build and cleanup are legacy as this is handled by containerlab now
# Leaving them in just in case I want to do other things in the future
case "${action}" in
  build)
    # I should really just call the build.sh script in the cc-ansible-core dir...
    # But I will likely use this to deploy multiple servers depending on the lab
    # in the future (i.e. Batfish, Grafana, Netbox, etc.) with extra flags (TODO)
    #sudo docker build -t cc-ansible ../../cc-ansible-core/. # Extra ../ as we call this from /labs dir
    #sudo docker image rm $(sudo docker image list -qf dangling=true)
    #sudo docker run --net management --ip 172.20.0.10 -d --name cc-server-ansible cc-ansible 
    ;;
  cleanup)
    #sudo docker stop $(sudo docker ps -qaf name=cc-server-ansible)
    #sudo docker rm $(sudo docker ps -qaf name=cc-server-ansible)
    ;;
  deploy)
    if [[ -z "${hostname}" || -z "${inventory}" || -z "${playbook}" ]]; then
      err "-i "${hostname}" or -i "${inventory}" or -p "${playbook}" flags are not defined in deploy script"
    else
      sudo docker exec -tu ansible -w /app cc-server-ansible ansible-playbook -i inventory/"${inventory}" "${playbook}" 
    fi
    ;;
  *) 
    err "Unexpected action: "${action}" used" ;;
esac

