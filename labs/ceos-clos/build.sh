#!/bin/bash
#
# Build the lab and run ../manage.sh with the relevant playbook / inventory

sudo containerlab deploy
echo "Sleeping for 10 seconds..."
sleep 10 # Give a little bit of time for everything to come up
bash ../manage.sh -a build 
bash ../manage.sh -a deploy -i clos.ini -p pb-import-ssh.yml
bash ../manage.sh -a deploy -i clos.ini -p pb-config-2clos.yml

# Build host networking (I should move this to the clab file)
sudo docker exec -d clab-ceos-clos-host1 ip link add dev bond0 type bond miimon 100 mode 802.3ad
sudo docker exec -d clab-ceos-clos-host1 ip link set dev eth1 down
sudo docker exec -d clab-ceos-clos-host1 ip link set dev eth2 down
sudo docker exec -d clab-ceos-clos-host1 ip link set dev bond0 down
sudo docker exec -d clab-ceos-clos-host1 ip link set dev eth1 master bond0
sudo docker exec -d clab-ceos-clos-host1 ip link set dev eth2 master bond0
sudo docker exec -d clab-ceos-clos-host1 ip link set dev eth1 up
sudo docker exec -d clab-ceos-clos-host1 ip link set dev eth2 up
sudo docker exec -d clab-ceos-clos-host1 ip link set dev bond0 up
sudo docker exec -d clab-ceos-clos-host1 ip link add link bond0 name bond0.100 type vlan id 100
sudo docker exec -d clab-ceos-clos-host1 ip link set dev bond0.100 up
sudo docker exec -d clab-ceos-clos-host1 ip addr add 192.168.100.11/24 brd 192.168.100.255 dev bond0.100

sudo docker exec -d clab-ceos-clos-host2 ip link add dev bond0 type bond miimon 100 mode 802.3ad
sudo docker exec -d clab-ceos-clos-host2 ip link set dev eth1 down
sudo docker exec -d clab-ceos-clos-host2 ip link set dev eth2 down
sudo docker exec -d clab-ceos-clos-host2 ip link set dev bond0 down
sudo docker exec -d clab-ceos-clos-host2 ip link set dev eth1 master bond0
sudo docker exec -d clab-ceos-clos-host2 ip link set dev eth2 master bond0
sudo docker exec -d clab-ceos-clos-host2 ip link set dev eth1 up
sudo docker exec -d clab-ceos-clos-host2 ip link set dev eth2 up
sudo docker exec -d clab-ceos-clos-host2 ip link set dev bond0 up
sudo docker exec -d clab-ceos-clos-host2 ip link add link bond0 name bond0.100 type vlan id 100
sudo docker exec -d clab-ceos-clos-host2 ip link set dev bond0.100 up
sudo docker exec -d clab-ceos-clos-host2 ip addr add 192.168.100.12/24 brd 192.168.100.255 dev bond0.100