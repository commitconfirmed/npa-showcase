# npa-showcase

Welcome! 

Here you will find a bunch of ready to go labs based on a wide variety of network topologies and automation concepts using the Containerlab as the orchestration engine. 

- [Design Summary](#design-summary)
- [Specs](#specs)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Design Detail](#design-detail)

### Design Summary

A labs Containerlab file will: 
- Build the Network device containers, relevant links between them and apply a basic managment configuration
- Build any Servers or Client containers used for traffic generation and validation
- Build the Automation & Telemetry stack and apply the relevant labs configuration (Ansible variables, Playbooks, Grafana Dashboards, etc.)

The aim here is to let the Automation & Telemetry stack configure, verify and monitor the particular labs setup to allow you to learn and tinker around with network automation concepts and products against a variety of network setups.

I've also tried to stay away from Containerlab/Vendor Kinds which are VM's. While nested VMs are supported in WSL2 with some magic from the Containerlab team & others (https://github.com/srl-labs/WSL-Containerlab), I'm just trying to keep things nice and simple here.

### Specs

Testing is done on my personal laptop, which is a: 
- Dell XPS 15 9530 with 32Gb of RAM
- Running Windows 11
- WSL2 installed
- Default Ubuntu WSL2 image
- Containerlab 0.60.1

Should hopefully work on a local/cloud Linux server as well. Let me know if you run into issues.

If Arista comes out with a docker image you don't need to register to get, I'll start learning Github codespaces :)

### Setup Instructions 

- Follow the Containerlab installation instructions at https://containerlab.dev/install/ for your relevant distribution
- Copy or clone this repo to a directory of your choosing
- Run the setup.sh script which will build the included containers (cc-ansible-core, cc-bird, etc.) and pull the vendor ones

> **Alert:** The Arista image you'll need to download off the Arista website and install yourself (steps below)

```
Grab cEOS64-lab-4.28.10.1M.tar from https://www.arista.com/en/support/software-download (Signup required)
Copy file onto your docker-ce host and then run the below command:
sudo docker import cEOS64-lab-4.28.10.1M.tar ceos:4.28.10.1M
```

### Usage

- See the README.md in the particular [labs](./labs/) folder to see more details about a specific lab and how to build and use it


### Design Detail

Refer to the below diagram

TBD