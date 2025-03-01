#!/bin/bash

INPUT="users.csv" #make sure to change the input!
OUTPUT="users.ldif" #use this file to ldapadd
BASE_DN="dc=ccdcldap,dc=local" #make sure to change the domain!

echo "" > $OUTPUT  # Clear previous LDIF file

while IFS=',' read -r cn uid sn givenName mail userPassword
do
    echo "dn: uid=$uid,ou=People,$BASE_DN" >> $OUTPUT
    echo "objectClass: inetOrgPerson" >> $OUTPUT
    echo "cn: $cn" >> $OUTPUT
    echo "sn: $sn" >> $OUTPUT
    echo "givenName: $givenName" >> $OUTPUT
    echo "uid: $uid" >> $OUTPUT
    echo "mail: $mail" >> $OUTPUT
    echo "userPassword: $(slappasswd -s $userPassword)" >> $OUTPUT  # Encrypts password
    echo "" >> $OUTPUT
done < <(tail -n +2 "$INPUT")  # Skip CSV header row

#to add the ldif file to the config: ldapadd -x -D "cn=Manager,dc=<domain name>,dc=<tld>" -W -f users.ldif
#to verify users were added: ldapsearch -x -LLL -b "dc=<domain name>,dc=<tld>" "(objectClass=inetOrgPerson)" cn uid

#Input file should look like this: 
#cn,uid,sn,givenName,mail,userPassword
#John Doe,jdoe,Doe,John,jdoe@example.com,securepass123

#Should look like this stored: 
#dn: uid=jdoe,ou=People,dc=ccdcldap,dc=local
#objectClass: inetOrgPerson
#cn: John Doe
#sn: Doe
#givenName: John
#uid: jdoe
#mail: jdoe@example.com
#userPassword: {SSHA}RANDOMHASHEDPASSWORD
