#!/bin/bash

# Update system and install LDAP packages on Debian-based systems
sudo apt update -y
sudo apt install -y slapd ldap-utils

# Configure firewall for LDAP (if UFW is used)
sudo ufw allow 389
sudo ufw reload

# Restart LDAP service
sudo systemctl restart slapd
sudo systemctl status slapd 