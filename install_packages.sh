#!/bin/bash

# Determine which is the default package manager
APT=$(which apt)
PACMAN=$(which pacman)
DNF=$(which dnf)
YUM=$(which yum)
ZYPPER=$(which zypper)

# install python3 and pip3 if not exist
if [ ${#APT} -gt 0 ]; then
    sudo apt-get install python3
    sudo apt-get install python3-pip
elif [ ${#PACMAN} -gt 0 ]; then
    sudo pacman -S python3
    sudo pacman -S python3-pip
elif [ ${#DNF} -gt 0 ]; then
    sudo dnf install python3
    sudo dnf install python3-pip
elif [ ${#YUM} -gt 0 ]; then
    sudo yum install python3
    sudo yum install python3-pip
elif [ ${#ZYPPER} -gt 0 ]; then
    sudo zypper install python3
    sudo zypper install python3-pip
else
    echo "Unknown package manager. Download one of the following:"
    echo "  apt, pacman, dnf, yum or zypper"
    echo ""
    echo "or use README.md for instructions."
    exit 1
fi


# install the all the necessery packages and requirements
sudo pip3 install --upgrade setuptools
sudo pip3 install -r requirements.txt

