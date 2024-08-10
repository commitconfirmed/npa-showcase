#!/bin/bash
#
# Rebuild the lab from scratch after making changes. If you just want to
# rebuild the ansible container, use the rebuild.sh script in the
# npa-showcase/cc-ansible-core directory

bash ./cleanup.sh
bash ./build.sh