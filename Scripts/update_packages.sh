#!/bin/bash

# define a list of package names
packages=('curl' 'vim' 'git')

# update libraries
sudo apt update

# upgrade packages
for package in "${packages[@]}"; do
    sudo apt install "$package"
done
