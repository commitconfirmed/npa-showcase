#!/bin/bash
# Rebuild the ansible container after making changes
# Use cleanup.sh and setup.sh if you have made changes to containerlab file
source ../manage.sh -a cleanup
source ../manage.sh -a build -i clos.ini -p pb-import-ssh.yml