FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install python and SSH server
RUN apt-get update -y; \
apt-get install -y gcc python3; \
apt-get install -y python3-pip; \
apt-get install -y iputils-ping openssh-server; \
apt-get install -y vim; \
apt-get clean all

# Install Ansible and SSH library (not included by default??)
RUN pip3 install -upgrade pip3; \
pip3 install ansible; \
pip3 install ansible-pylibssh

# Configure SSH server (TBD from Volume / secured)
RUN groupadd -r ansible && useradd -rm -d /home/ansible -s /bin/bash -g ansible -G sudo -u 1000 ansible && \
echo 'ansible:test' | chpasswd

RUN mkdir /var/run/sshd && \
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
echo "export VISIBLE=now" >> /etc/profile

USER ansible

# Create empty known_hosts file for SSH key importing by ansible playbook import-ssh.yml
RUN mkdir ~/.ssh && \
touch ~/.ssh/known_hosts

WORKDIR /app
COPY --chown=ansible:ansible app /app

EXPOSE 22

USER root

CMD ["/usr/sbin/sshd", "-D"]