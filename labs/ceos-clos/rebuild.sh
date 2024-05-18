#!/bin/bash
# Rebuild the ansible container after making changes
# Use cleanup.sh if you have made changes to containerlab YAML file
source ../manage.sh -a cleanup
source build.sh