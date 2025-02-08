#!/bin/bash
ldapmodify -Y EXTERNAL -H ldapi:/// <<EOF
dn: cn=default,ou=policies,dc=ccdcldap,dc=local
changetype: add
objectClass: pwdPolicy
cn: default
pwdAttribute: userPassword
pwdLockout: TRUE
pwdLockoutDuration: 900
pwdMaxFailure: 5
pwdFailureCountInterval: 600
EOF

#What this does:
	#	Locks account after 5 failed attempts
	#	Unlocks after 15 minutes (900 seconds)
	#	Failed attempts reset every 10 minutes
