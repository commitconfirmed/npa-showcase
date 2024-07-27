#!/bin/bash
#
# Remove the containerlab devices and the ansible container
# Make sure you run this before deploying a different lab

sudo containerlab destroy --cleanup
bash ../manage.sh -a cleanup