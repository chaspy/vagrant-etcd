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

# Set environment variable for etcd cluster
export ETCD_HOST_IP=$(ip addr show enp0s8 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
export ETCD_NAME=$(hostname -s)
echo "ETCD_HOST_IP=${ETCD_HOST_IP}" >> /etc/default/etcd
echo "ETCD_NAME=${ETCD_NAME}" >> /etc/default/etcd

# Configure Systemd and start etcd service
# Create a new systemd service file for etcd.
cp /vagrant/etcd.service /etc/systemd/system/etcd.service
# Reload systemd service and start etcd on Ubuntu 18,04 / Ubuntu 16,04
sudo systemctl  daemon-reload

# Install Golang
# ref: https://github.com/golang/go/wiki/Ubuntu
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get -y update
sudo apt-get -y install golang-go
# Install etcd/client
go get go.etcd.io/etcd/client

# Install Ruby
# ref: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04
export RUBY_VERSION="2.6.3"
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
# Install etcd client
gem install etcd
