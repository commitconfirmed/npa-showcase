# npa-showcase
Network Programmability and Automation showcases, built on WSL2

Design

I've used containerlab only the build the Network containers with basic management config and connecting relevant interfaces. The rest of the device configuration will be done with Ansible playbooks to more closely mimic what you would actually do in a live network with real hardware.

Setup Instructions

- Prep your windows machine with WSL2 in powershell as admin
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

- Check you can clone / pull a repo, and optionally edit and push changes on your WSL VM machine. If you're using VS code as your IDE to modify files and perform commits then you only need to "git pull" on your WSL VM to get your changes
git clone x
git pull 
git push 
git commit 