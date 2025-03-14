#!/bin/bash
slapcat > ldap-backup.ldif

#Restore LDAP from backup
#service slapd stop
#slapadd -v -l ldap-backup.ldif
#chown -R ldap:ldap /var/lib/ldap
#service slapd start
