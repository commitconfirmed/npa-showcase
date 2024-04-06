#!/bin/bash

# Quick script to tcpdump a Containerlab Network Namespace
usage="Usage: $(basename "$0") namespace interface -- example ./$(basename "$0") basic-clab-eos1 eth1"

# Start capture, uncomment the relevant netns exec command if you want it on wireshark or cli
if [[ -z $1 && -z $2 ]]; then
  echo $usage
else
  echo Running Capture on router $1 interface $2
  #sudo ip netns exec $1 tcpdump -nni $2
  sudo ip netns exec $1 tcpdump -U -nni $2 -w - | /mnt/c/Program\ Files/Wireshark/wireshark.exe -k -i -
fi