#/bin/bash

whois_info=$(whois "$1")
created_on=$(echo "$whois_info" | grep 'Created On:')

echo "
====================
Objetive: $1
Created On: $created_on
Contact Name:
City:
State:


====================


"


