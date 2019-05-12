#!/bin/bash
sudo apt-get update -y

# Install etcd
# ref: https://computingforgeeks.com/how-to-install-etcd-on-ubuntu-18-04-ubuntu-16-04/

# Check the pre-built release binaries before you proceed to get the latest release tag.
# ref: https://github.com/etcd-io/etcd/releases
# Download the latest release of etcd on Ubuntu 18.04 / Ubuntu 16.04:
sudo apt -y install wget
export RELEASE="3.3.12"
wget https://github.com/etcd-io/etcd/releases/download/v${RELEASE}/etcd-v${RELEASE}-linux-amd64.tar.gz
# Extract downloaded archive file.
tar xvf etcd-v${RELEASE}-linux-amd64.tar.gz
# Change to new file directory
cd etcd-v${RELEASE}-linux-amd64
# Move etcd and etcdctl binary files to /usr/local/bin directory.
sudo mv etcd etcdctl /usr/local/bin 
# Confirm version.
etcd --version
# Create Etcd configuration file and data directory.
sudo mkdir -p /var/lib/etcd/
sudo mkdir /etc/etcd
# Create etcd system user
sudo groupadd --system etcd
sudo useradd -s /sbin/nologin --system -g etcd etcd
# Set /var/lib/etcd/ directory ownership to etcd user.
sudo chown -R etcd:etcd /var/lib/etcd/

# Configure Systemd and start etcd service
# Create a new systemd service file for etcd.
cp /vagrant/etcd.service /etc/systemd/system/etcd.service
# Reload systemd service and start etcd on Ubuntu 18,04 / Ubuntu 16,04
sudo systemctl  daemon-reload
sudo systemctl  start etcd.service
# Check service status:
sudo systemctl  status etcd.service
# etcdctl member list
etcdctl member list
