#!/bin/bash
#to delete users with ldapdelete, if you have a file, make sure to cut out the 'dn: ' part; only include the uid and beyond. 

#use below command to delete singular user 
#ldapdelete -x -D "cn=admin,dc=ccdcldap,dc=local" -W "uid=jdoe,ou=People,dc=ccdcldap,dc=local"

#use below command to delete multiple users from a file 
#ldapdelete -x -D "cn=admin,dc=ccdcldap,dc=local" -W -f delete_users.ldif
#make sure to exclude 'dn: '

#use below command to verify user is gone
#ldapsearch -x -D "cn=admin,dc=ccdcldap,dc=local" -W -b "dc=ccdcldap,dc=local" "(uid=username)"

#use below command to return all users 
#ldapsearch -x -D "cn=admin,dc=ccdcldap,dc=local" -W -b "dc=ccdcldap,dc=local" "(objectClass=inetOrgPerson)"
