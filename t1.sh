#/bin/bash

ip=$1
#ping= ping $1
#hostname= whois $1  | grep 'name' & 'Name' & 'Nombre' 
domain_name=$(whois $1 | grep 'Domain Name')
created_on=$(whois $1 | grep 'Created On:')
expiration_date=$(whois $1 | grep 'Expiration Date:')
url=$(whois $1 | grep 'URL:')



echo "
====================
Objetive: $ip 
$created_on
$expiration_date
$url
Contact Name:
City:
State:


====================


"


