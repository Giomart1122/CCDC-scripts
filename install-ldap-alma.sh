#!/bin/bash

# Update system and install LDAP packages on AlmaLinux
sudo dnf update -y
sudo dnf install -y openldap openldap-servers openldap-clients
sudo systemctl enable slapd
sudo systemctl start slapd

# Configure firewall for LDAP
sudo firewall-cmd --permanent --add-service=ldap
sudo firewall-cmd --reload

#show status
sudo systemctl show slapd