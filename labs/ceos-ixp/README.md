# Arista + BIRD IXP lab
A 3 peer, 2 route server lab showing example peering functionality with Arista cEOS and BIRD

Concepts: Arista, BIRD, Peering, eBGP, IXP, Transit, Prepending, Localpref

### Diagram

![Network Diagram](./ceos-ixp.drawio.svg)

### Requirements

WSL2 (or a Linux VM) with docker-ce & containerlab

Memory: ~10Gb

### Usage

- Run the setup.sh script to build the lab
- Run the verify.sh script to see some basic validation that the lab is working
- Run the rebuild.sh script if you've made changes to the Ansible container
- Run the cleanup.sh script once you are done