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

while getopts 'a:i:p:v' flag; do
  case "${flag}" in
    a) action="${OPTARG}" ;;
    i) inventory="${OPTARG}" ;;
    p) playbook="${OPTARG}" ;;
    v) verbose='true' ;;
    *) 
      err "Unexpected option "${flag}"" ;;
  esac
done

# Perform relevant lab action
case "${action}" in
  build)
    if [[ -z "${inventory}" || -z "${playbook}" ]]; then
      err "-i "${inventory}" or -p "${playbook}" flags are not defined in setup script"
    else
      sudo docker build -t cc-ansible ../../cc-ansible-core/. # Extra ../ as we call this from /labs dir
      sudo docker image rm $(sudo docker image list -qf dangling=true)
      sudo docker run -d --name lab_ansible cc-ansible
      sudo docker network connect management $(sudo docker ps -qaf name=lab_ansible)
      sudo docker exec -tu ansible -w /app lab_ansible ansible-playbook -i inventory/"${inventory}" "${playbook}" 
    fi
    ;;
  cleanup)
    sudo docker stop $(sudo docker ps -qaf name=lab_ansible)
    sudo docker rm $(sudo docker ps -qaf name=lab_ansible)
    ;;
  *) 
    err "Unexpected action: "${action}" used" ;;
esac

