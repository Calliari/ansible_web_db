#!/bin/bash

sudo apt-get update -y

# Install python an additional package on ec2 instance.
# Ubuntu Server 16.04 LTS on AWS doesn't have this installed
# This is necessary for ansible to connect with to remote servers
sudo apt-get install python-minimal -y
# sudo apt install python-pip -y
# sudo pip install --upgrade pip
