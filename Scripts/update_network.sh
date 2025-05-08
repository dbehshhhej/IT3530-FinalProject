#!/bin/bash

# define a list of package names
network_tools=('net-tools')

# update libraries
sudo apt update

# upgrade packages
for tool in "${network_tools[@]}"; do
    sudo apt install --only-upgrade "$tool"
done
