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

## Preguntas
1. Menciona los tipos de protocolos de red.
2. Respecto a la pregunta anterior. ¿Cómo funcionan? ¿Para qué sirven?
3. ¿Qué es un sniffer?
4. ¿Qué significa OSINT? ¿Para qué sirve?
5. Investiga los 5 OSINT más usados.
6. Investiga 5 softwares no mencionados en la práctica que sirvan para el análisis de comunicaciones.
7. ¿Por qué se considera a las personas como el eslabón más débil de seguridad?
8. ¿Qué acciones haces para protegerte de ciberataques?
9. ¿Crees que tus métodos preventivos son suficientes?

## Secciones:
**Requisitos:** Se debe incluir todo lo que se necesita para obtener la información mediante la prueba de penetración. Por ejemplo ¿qué problema se quiere resolver o qué se quiere saber? ¿Qué información es necesaria para ello? ¿Para qué?
**Identificación de fuentes de información:** ¿Qué fuentes pueden aportar información valiosa y veraz?

**Adquisición:** Etapa de obtención de la información. Explicación del script.
**Procesamiento:** Dar formato a toda la información sin filtrar obtenida en la fase anterior. En caso de querer obtener más información explicar el posible uso de la misma, así como su relevancia.
 **Análisis:** Generar datos de inteligencia a partir de todos los datos obtenidos, identificando relaciones entre estos que hagan y posibles vulnerabilidades. Se puede usar como referencia el ejemplo de la sección anterior.
 **Propuestas:** Presentar propuestas de ataque formuladas por el alumno teniendo en cuenta lo hecho en el inciso anterior.

 ## Referencias
