#!/bin/bash
#
# Build the cc-ansible container. As the container tags are different per lab
# you will need to run the rebuild script in the particular lab as well
#
# Use rebuild if you are editing the configuration while a lab is deployed.
# Otherwise just ssh/exec in and edit the files locally, remembering
# that they won't be saved if you ever rebuild the container!

sudo docker build -t cc-ansible .
sudo docker image rm $(sudo docker image list -qf dangling=true)