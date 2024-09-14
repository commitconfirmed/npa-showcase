#!/bin/bash
#
# Cleanup the relevant lab

usage="Usage: $(basename "$0") lab-name \n 
Example to cleanup the ceos-anycast lab - ./$(basename "$0") ceos-anycast"

if [[ -z $1 ]]; then
  echo $usage
else
  # We go into the clab directory to remove the clab folder created during deployment
  cd $1
  sudo containerlab destroy --cleanup
  cd ..
fi