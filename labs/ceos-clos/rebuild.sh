#!/bin/bash
# Rebuild the ansible container after making changes
# Use cleanup.sh and setup.sh if you have made changes to containerlab file
bash ../manage.sh -a cleanup
bash ../manage.sh -a build -i clos.ini -p pb-import-ssh.yml