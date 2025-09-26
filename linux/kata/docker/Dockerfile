FROM ubuntu:22.04

ENV container=docker

RUN useradd -m -s /bin/bash docker && \
    echo "docker:docker" | chpasswd && \
    usermod -aG sudo docker

# Install systemd
RUN apt-get update && \
    apt-get install -y systemd systemd-sysv dbus && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]

