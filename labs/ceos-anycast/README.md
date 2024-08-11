# Arista + BIRD BGP Anycast lab

> [!CAUTION]
> Currently a work in progress 

A 2 spine, 4 leaf & 4 server (using BIRD) lab demonstration on how you can use BGP in an anycast fashion to load balance and dynamically route traffic towards 3 servers sharing the same IP address and how re-routing occurs in certain failure scenarios

Concepts: Arista, BIRD, BGP, Anycast, Route Reflector, Load Balancing, Hashing, Unnumbered BGP

### Diagram

![Network Diagram](./ceos-anycast.drawio.svg)

### Requirements

WSL2 (or a Linux VM) with docker-ce & containerlab

Memory: ~14Gb

### Usage

- Run the setup.sh script to build the lab
- Run the verify.sh script to see some basic validation that the lab is working
- Run the rebuild.sh script if you've made changes to the Ansible container or clab.yml file
- Run the cleanup.sh script once you are done