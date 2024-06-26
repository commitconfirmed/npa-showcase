# npa-showcase
Network Programmability and Automation labs, built on WSL2

### Design

I've used containerlab only the build the Network containers with basic management config and connecting relevant interfaces. The rest of the device configuration will be done with Ansible playbooks to more closely mimic what you would actually do in a live network with real hardware.

This repo is a constant work in progress so things will likely be broken from time to time as I tinker and learn, it is best if you want to play around yourself to clone this repo and change the origin or just browse and copy the bits you want.

https://stackoverflow.com/questions/18200248/cloning-a-repo-from-someone-elses-github-and-pushing-it-to-a-repo-on-my-github

### Specs

Tested on a Dell XPS 15 9530 with 32Gb of RAM running on Windows 11

### Setup Instructions

- Prep your windows machine with WSL2 in powershell as admin (just using the default Ubuntu that comes with WSL)
```
wsl --install
```

- Install docker-ce (don't use docker desktop as per the containerlab recommendations)
```
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```

- Start docker
```
sudo service docker start
```

- Install Containerlab
```
echo "deb [trusted=yes] https://apt.fury.io/netdevops/ /" | \
sudo tee -a /etc/apt/sources.list.d/netdevops.list

sudo apt update && sudo apt install containerlab
```

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

- Check you can clone / pull this repo, and optionally edit and push changes on your WSL VM machine. If you're using VS code as your IDE to modify files and perform commits then you only need to "git pull" on your WSL VM to get your changes. Would recommend cloning and changing the origin if you want to tinker

```
git clone x
git pull 
```

- To save a bit of time with deployment, grab and store the container images from the networking vendor(s) you wish to use. 

+Arista+
```
- Grab cEOS64-lab-4.28.10.1M.tar from https://www.arista.com/en/support/software-download (Signup required)
- Copy file onto your WSL2 host
docker import cEOS64-lab-4.28.10.1M.tar ceos:4.28.10.1M
```

- Follow the README's in the labs folder to see more details about a specific lab and how to build it