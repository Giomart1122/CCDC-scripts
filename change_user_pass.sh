#!/bin/bash
ldappasswd -x -D "cn=Manager,dc=ccdcldap,dc=local" -W -s NewSecurePassword "uid=lharris,ou=People,dc=ccdcldap,dc=local"
