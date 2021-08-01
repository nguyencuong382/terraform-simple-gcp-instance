#!/bin/bash

# install_docker_and_tools
echo "Installing Docker..."
wget -qO- https://get.docker.com/ | sh
sudo usermod -a -G docker $USER 
chmod 777 /var/run/docker.sock


sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose