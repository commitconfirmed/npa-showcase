# npa-showcase
Network Programmability and Automation showcases, built on WSL2

Instructions

- Prep your windows machine with WSL2 in powershell as admin
```
wsl --install
```

- Install docker-ce (don't use docker desktop)
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

- Setup GIT
```
git config --global user.name "user"
git config --global user.email "em@ai.l"
```

- Test