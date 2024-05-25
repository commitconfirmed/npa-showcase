#!/bin/sh
#

sudo docker build -t cc-bird .
sudo docker image rm $(sudo docker image list -qf dangling=true)