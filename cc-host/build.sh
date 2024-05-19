#!/bin/sh
#

sudo docker build -t cc-host .
sudo docker image rm $(sudo docker image list -qf dangling=true)