#!/bin/bash
# Rebuild the ansible container after making changes
# Use cleanup.sh if you have made changes to containerlab YAML file
sudo containerlab destroy
source ../manage.sh -a cleanup