#!/bin/bash
ldapsearch -x -LLL -b "dc=ccdcldap,dc=local" "(objectClass=inetOrgPerson)"
#dont forget to change Base DN
