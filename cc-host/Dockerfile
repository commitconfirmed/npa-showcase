FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install SSH, bonding and basic network verification tools
RUN apt-get update -y; \
apt-get install -y kmod ifenslave iproute2 tcpdump; \
apt-get install -y iputils-ping openssh-server iperf3; \
apt-get install -y sudo vim; \
apt-get clean all

# Configure SSH server (TODO: secure user/pass creation)
RUN groupadd -r admin && useradd -rm -d /home/admin -s /bin/bash -g admin -G sudo -u 1000 admin && \
echo 'admin:admin' | chpasswd

RUN mkdir /var/run/sshd && \
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

USER root

ENTRYPOINT ["/usr/sbin/sshd", "-D"]