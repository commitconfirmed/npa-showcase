#!/bin/bash
#
# Rebuild the lab from scratch after making changes. If you just want to
# rebuild the ansible container, use the rebuild.sh script in the
# npa-showcase/cc-ansible-core directory

sudo containerlab destroy
bash ../manage.sh -a cleanup
bash ../manage.sh -a build -i clos.ini -p pb-import-ssh.yml