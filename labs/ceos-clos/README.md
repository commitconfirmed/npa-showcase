# Arista cEOS 2 tier CLOS Lab

> [!CAUTION]
> Currently broken until I re-do the Ansible configuration into Jinja2

A 4 leaf, 2 spine, 2 host lab showing EVPN-VXLAN functionality with Arista cEOS

Concepts: VXLAN, EVPN, BGP Unnumbered, Arista, EOS, Leaf, Spine, MLAG, ECMP

### Diagram

TBD

### Requirements

WSL2 (or a Linux VM) with docker-ce & containerlab

Memory: ~14Gb

### Usage

- Run the setup.sh script to build the lab
- Run the verify.sh script to see some basic validation that the lab is working
- Run the rebuild.sh script if you've made changes to the Ansible container
- Run the cleanup.sh script once you are done