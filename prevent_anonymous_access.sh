ldapmodify -Y EXTERNAL -H ldapi:/// <<EOF
dn: olcDatabase={2}mdb,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0} to * by self write by users read by anonymous auth
EOF
