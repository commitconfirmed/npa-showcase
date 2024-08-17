FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install SSH, BIRD and basic network verification tools
RUN apt-get update -y; \
apt-get install -y iproute2 bird2 tcpdump; \
apt-get install -y iputils-ping openssh-server; \
apt-get install -y sudo vim; \
apt-get clean all

# Configure a non root user with sudo access for ansible playbook execution
RUN groupadd -r admin && useradd -rm -d /home/admin -s /bin/bash -g admin -G sudo -u 1000 admin && \
echo 'admin:admin' | chpasswd

# Configure SSH server (TODO: secure user/pass creation)
RUN mkdir /var/run/sshd && \
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

USER root

# For some reason this directory and file aren't created on bird install which
# will prevent bird from starting
# bird: Cannot create control socket /run/bird/bird.ctl: No such file or directory
RUN mkdir /run/bird
RUN touch /run/bird/bird.ctl

# We will use ansible to configure and then run BIRD depending on the lab topology
ENTRYPOINT ["/usr/sbin/sshd", "-D"]