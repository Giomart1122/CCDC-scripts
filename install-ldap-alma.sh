#!/bin/bash
#remember to add alma or default user to sudoers file first before preceding
# Install necessary package with ldap-server
sudo dnf install epel-release
# install LDAP packages on AlmaLinux
# sudo dnf update -y (make sure u did this upon boot)
sudo dnf install -y openldap openldap-servers openldap-clients
sudo systemctl enable slapd
sudo systemctl start slapd

# Configure firewall for LDAP
sudo firewall-cmd --permanent --add-service=ldap
sudo firewall-cmd --reload

#show status
sudo systemctl status slapd