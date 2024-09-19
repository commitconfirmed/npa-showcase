# npa-showcase

Welcome! 

Here you will find a bunch of ready to go labs based on a wide variety of network topologies and automation concepts using the Containerlab as the orchestration engine. 

### Design Summary

A labs Containerlab file will: 
- Build the Network device containers, relevant links between them and apply a basic managment configuration
- Build any Servers or Client containers used for traffic generation
- Build the Automation & Telemetry stack and apply the relevant labs configuration (Ansible variables, Playbooks, Grafana Dashboards, etc.)

The aim here is to let the Automation & Telemetry stack configure, verify and monitor the particular labs setup to allow you to learn and tinker around with network automation concepts and products against a variety of network setups.

This repo is currently a constant work in progress so things will likely be broken from time to time as I tinker and learn. I will generally create a branch when building new labs or retrofitting existing ones before merging it into the main branch. 

### Design Detail

Refer to the below diagram

TBD

### Specs

Tested on a Dell XPS 15 9530 with 32Gb of RAM running on Windows 11

### Setup Instructions

I've tested these labs on my personal laptop, which is just a Dell XPS 15 9530 with 32Gb of RAM running Windows 11 and WSL2.

These should also work on any Linux server with Docker installed, locally or in the cloud. If Arista comes out with a Docker image you don't need to register to get, I'll eventually try and get this working on Github codespaces as well :) 

- Follow the Containerlab installation instructions at https://containerlab.dev/install/ for your relevant distribution
- Copy or clone this repo to a directory of your choosing
- Run the setup.sh script which will build the included containers (cc-ansible-core, cc-bird, etc.) and pull the vendor ones
  - Note: The Arista image you'll need to download off the Arista website and install yourself (steps below)

```
Grab cEOS64-lab-4.28.10.1M.tar from https://www.arista.com/en/support/software-download (Signup required)
Copy file onto your docker-ce host and then run the below command:
sudo docker import cEOS64-lab-4.28.10.1M.tar ceos:4.28.10.1M
```

### Usage Instructions

- Follow the README's in the labs folder to see more details about a specific lab and how to build it

### Visual Studio Code and WSL2

Added some notes below which I used when working with WSL2. I would also recommend just using the WSL extension in VSCode as well to do development locally on your WSL2 host.

- (optional) Install VSCode and GIT on windows, ensure you include GCM and linux file endings only
- Setup GIT and GH CLI on your WSL box

```
git config --global user.name "user"
git config --global user.email "user@dev.null"

sudo apt install gh
gh auth login
gh auth status
gh auth setup-git
```

- Check you can clone this (or any other) repo. Would recommend cloning and changing the origin if you want to tinker

```
git clone https://github.com/commitconfirmed/npa-showcase/
```