# web_recon

## Integrantes:

- Marco
- Violeta
- Ximena

## Uso:

Herramienta de Web Recon para hacer análisis y recopilación de información de páginas web, dominios y direcciones IP.

Funciona principalmente para dominios `.mx` y permite automatizar parte de la fase de reconocimiento de una prueba de penetración.

La herramienta obtiene información como:

- Datos WHOIS.
- Fecha de creación, actualización y expiración del dominio.
- Organización y datos de contacto disponibles.
- Conectividad.
- Latencia y pérdida de paquetes.
- Direcciones IPv4 e IPv6.
- Registros DNS.
- Registros reversos.
- Ruta y saltos hacia el objetivo.
- Subdominios.
- Segmentos de red.
- Puertos, estados, servicios y versiones.

Los resultados se guardan automáticamente en un archivo `.txt` con el nombre del dominio o IP analizada.

## Herramientas usadas:

- `whois`: Obtiene información del registro del dominio o dirección IP.
- `ping`: Comprueba conectividad, latencia y pérdida de paquetes.
- `nslookup`: Realiza consultas DNS, IPv4, IPv6 y resolución reversa.
- `traceroute`: Muestra la ruta y los saltos hasta el objetivo.
- `findomain`: Busca subdominios asociados al dominio.
- `sublist3r`: Realiza enumeración de subdominios utilizando fuentes públicas.
- `subfinder`: Busca subdominios mediante distintas fuentes de información.
- `dnsrecon`: Realiza enumeración y reconocimiento DNS.
- `dnsmap`: Busca información DNS y posibles subdominios.
- `nmap`: Obtiene información sobre puertos, estados, servicios y versiones.
- `EtherApe`: Permite observar gráficamente el tráfico generado durante el análisis. Se utiliza por separado del script.

## Como usar:

Primero se deben dar permisos de ejecución al script:

```bash
chmod +x t1.sh
```

Después se ejecuta indicando como argumento un dominio:

```bash
./t1.sh unam.mx
```

También se puede utilizar una dirección IP:

```bash
./t1.sh 132.248.10.7
```

Durante la ejecución se mostrará en la terminal qué herramienta se está utilizando:

```text
[*] Ejecutando WHOIS sobre unam.mx...
[+] WHOIS terminado.

[*] Ejecutando Ping sobre unam.mx...
[+] Ping terminado.

[*] Ejecutando Nmap sobre unam.mx...
```

Al finalizar se genera un archivo de texto con los resultados:

```text
unam.mx.txt
```

Para observar el tráfico generado durante el análisis se puede ejecutar EtherApe en otra terminal:

```bash
sudo etherape
```

Y posteriormente ejecutar `web_recon` normalmente.

Algunas herramientas pueden tardar varios minutos dependiendo del dominio analizado y de la respuesta de los servidores.
