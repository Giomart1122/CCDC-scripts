#!/bin/bash
ldappasswd -x -D "cn=Manager,dc=ccdcldap,dc=local" -W -s <new password unhashed> "uid=lharris,ou=People,dc=ccdcldap,dc=local"

#verify the change
#ldapwhoami -x -D "uid=lharris,ou=People,dc=ccdcldap,dc=local" -W
