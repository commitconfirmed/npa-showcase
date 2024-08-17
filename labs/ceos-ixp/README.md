# Arista + BIRD IXP lab

> [!CAUTION]
> Currently not working as I'm working on moving from BIRD 1.6 to BIRD 2.0

A 3 peer, 2 route server & 1 ISP eBGP lab demonstrating peering and Internet routing functionality with Arista cEOS and BIRD, and how manipulation of local preference, AS prepending and communities influences routing decisions.

Concepts: Arista, BIRD, Peering, eBGP, IXP, Transit, Prepending, Localpref, Communities

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