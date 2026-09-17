#!/bin/bash

target="$1"

if [ -z "$target" ]; then
    echo "Uso: $0 <dominio_o_ip>"
    exit 1
fi

whois_info=$(whois "$target" 2>&1)

created_on=$(echo "$whois_info" | grep -Ei -m 1 '^(Created On|Creation Date|Created|created):')
updated_on=$(echo "$whois_info" | grep -Ei -m 1 '^(Updated On|Updated Date|Last Updated On|changed):')
expiration_date=$(echo "$whois_info" | grep -Ei -m 1 '^(Expiration Date|Registry Expiry Date|Expiry Date|paid-till):')
URL=$(echo "$whois_info" | grep -Ei -m 1 '^(URL|Registrar URL):')

registrant_info=$(echo "$whois_info" | grep -Ei -m 1 '^(Registrant|Registrant Name|person|contact):')
organization=$(echo "$whois_info" | grep -Ei -m 1 '^(Registrant Organization|Organization|OrgName|org-name):')

country=$(echo "$whois_info" | grep -Ei -m 1 '^(Registrant Country|Country|country):')
state=$(echo "$whois_info" | grep -Ei -m 1 '^(Registrant State/Province|State|state):')
city=$(echo "$whois_info" | grep -Ei -m 1 '^(Registrant City|City|city):')
street=$(echo "$whois_info" | grep -Ei -m 1 '^(Registrant Street|Address|address):')
postal_code=$(echo "$whois_info" | grep -Ei -m 1 '^(Registrant Postal Code|Postal Code|postal-code):')

contact_info=$(echo "$whois_info" | grep -Ei \
'(Registrant Name|Admin Name|Tech Name|person:|Registrant Email|Admin Email|Tech Email|e-mail:|email:|Registrant Phone|Admin Phone|Tech Phone|phone:)' \
| head -n 20)


query_date=$(date '+%Y-%m-%d %H:%M:%S')


ping_info=$(ping -c 4 -W 2 "$target" 2>&1)

packet_loss=$(echo "$ping_info" | grep -oE '[0-9]+% packet loss' | head -n 1)

avg_latency=$(echo "$ping_info" | awk -F'=' \
'/rtt|round-trip/ {
    split($2,a,"/");
    gsub(/ /,"",a[2]);
    print a[2] " ms"
}')


if echo "$ping_info" | grep -q '0% packet loss'; then

    availability="Disponible por ICMP"

elif echo "$ping_info" | grep -q 'received'; then

    availability="Respuesta parcial por ICMP"

else

    availability="Sin respuesta ICMP (esto no demuestra que el host este caido)"

fi


traceroute_info=$(traceroute -m 15 -w 2 "$target" 2>&1)


if [[ "$target" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] || [[ "$target" == *:* ]]; then

    target_type="IP"

    ipv4_info="$target"
    ipv6_info="Entrada proporcionada directamente como IP"

    reverse_info=$(nslookup "$target" 2>&1)

    dns_records="No aplica: la entrada es una direccion IP"

    subdomains="No aplica: la entrada es una direccion IP"

    dnsrecon_info="No aplica: la entrada es una direccion IP"

    dnsmap_info="No aplica: la entrada es una direccion IP"

    public_ip="$target"

else

    target_type="Dominio"


    ipv4_info=$(nslookup -type=A "$target" 2>&1)

    ipv6_info=$(nslookup -type=AAAA "$target" 2>&1)


    ipv4_addresses=$(echo "$ipv4_info" |
        awk '/^Address: / {print $2}' |
        grep -v '#53'
    )


    public_ip=$(echo "$ipv4_addresses" | head -n 1)


    reverse_info=""

    for ip in $ipv4_addresses; do

        reverse_info+="===== $ip ====="$'\n'

        reverse_info+="$(nslookup "$ip" 2>&1)"$'\n'

    done


    dns_records="
--- NS ---
$(nslookup -type=NS "$target" 2>&1)

--- MX ---
$(nslookup -type=MX "$target" 2>&1)

--- SOA ---
$(nslookup -type=SOA "$target" 2>&1)
"


    findomain_info=$(findomain -t "$target" -q 2>&1)

    sublist3r_info=$(sublist3r -d "$target" 2>&1)

    subfinder_info=$(subfinder -d "$target" -silent 2>&1)


    subdomains="
--- Findomain ---
$findomain_info

--- Sublist3r ---
$sublist3r_info

--- Subfinder ---
$subfinder_info
"


    dnsrecon_info=$(dnsrecon -d "$target" -t std 2>&1)

    dnsmap_info=$(dnsmap "$target" 2>&1)

fi


if [ -n "$public_ip" ]; then

    ip_whois=$(whois "$public_ip" 2>&1)

    ip_segment=$(echo "$ip_whois" |
        grep -Ei -m 2 '^(CIDR|NetRange|inetnum):'
    )

else

    ip_segment="No se pudo determinar"

fi


nmap_info=$(nmap -sV "$target" 2>&1)


output_file="${target//\//_}.txt"


echo "
====================

Objetive: $target
Tipo de entrada: $target_type
Fecha del analisis: $query_date


===== WHOIS =====

$created_on
$updated_on
$expiration_date

$URL

$registrant_info
$organization

$country
$state
$city
$street
$postal_code


===== PERSONAL Y CONTACTO =====

$contact_info


===== CONECTIVIDAD Y LATENCIA =====

Disponibilidad: $availability

Perdida de paquetes: $packet_loss

Latencia promedio: $avg_latency

$ping_info


===== IP PUBLICA Y SEGMENTO =====

IP principal: $public_ip

$ip_segment


===== REGISTROS IPv4 =====

$ipv4_info


===== REGISTROS IPv6 =====

$ipv6_info


===== REGISTROS REVERSOS =====

$reverse_info


===== RUTA Y SALTOS =====

$traceroute_info


===== REGISTROS DNS =====

$dns_records


===== ENUMERACION DE SUBDOMINIOS =====

$subdomains


===== DNSRECON =====

$dnsrecon_info


===== DNSMAP =====

$dnsmap_info


===== NMAP: PUERTOS, ESTADOS Y SERVICIOS =====

$nmap_info


====================
" > "$output_file"


echo "Reporte guardado en: $output_file"
