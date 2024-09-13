# Arista + BIRD BGP Anycast lab

A 2 spine, 4 leaf & 4 server (using BIRD) lab demonstration on how you can use BGP in an anycast fashion to load balance and dynamically route traffic towards 4 servers sharing the same IP address and how re-routing occurs in certain failure scenarios

Concepts: Arista, BIRD, BGP, Anycast, Route Reflector, Load Balancing, Hashing, Unnumbered BGP, ECMP

### Diagram

![Network Diagram](./ceos-anycast.drawio.svg)

### Requirements

WSL2 (or a Linux VM) with docker-ce & containerlab

Memory: ~14Gb

### Usage

- Run the build.sh script to build the lab
- Browse to Grafana on  http://localhost:3000 and open the Anycast lab Dashboard
- SSH into clab-ceos-anycast-ubu-host1 (admin/admin) and run the iperf-client.sh script to generate traffic
- Run the cleanup.sh script once you are done