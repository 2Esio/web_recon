# web_recon

## Integrantes:

* Flores Cid Marco
* Castillo Camacho Violeta Ardeni
* Sánchez Cervantes Yolanda Ximena

## Uso:

Herramienta de Web Recon para hacer análisis y recopilación de información de páginas web, dominios y direcciones IP.

Funciona principalmente para dominios `.mx` y permite automatizar parte de la fase de reconocimiento de una prueba de penetración.

La herramienta obtiene información como:

* Datos WHOIS.
* Fecha de creación, actualización y expiración del dominio.
* Organización y datos de contacto disponibles.
* Conectividad.
* Latencia y pérdida de paquetes.
* Direcciones IPv4 e IPv6.
* Registros DNS.
* Registros reversos.
* Ruta y saltos hacia el objetivo.
* Subdominios.
* Segmentos de red.
* Puertos, estados, servicios y versiones.

Los resultados se guardan automáticamente en un archivo `.txt` con el nombre del dominio o IP analizada.

## Herramientas usadas:

* `whois`: Obtiene información del registro del dominio o dirección IP.
* `ping`: Comprueba conectividad, latencia y pérdida de paquetes.
* `nslookup`: Realiza consultas DNS, IPv4, IPv6 y resolución reversa.
* `traceroute`: Muestra la ruta y los saltos hasta el objetivo.
* `findomain`: Busca subdominios asociados al dominio.
* `sublist3r`: Realiza enumeración de subdominios utilizando fuentes públicas.
* `subfinder`: Busca subdominios mediante distintas fuentes de información.
* `dnsrecon`: Realiza enumeración y reconocimiento DNS.
* `dnsmap`: Busca información DNS y posibles subdominios.
* `nmap`: Obtiene información sobre puertos, estados, servicios y versiones.
* `EtherApe`: Permite observar gráficamente el tráfico generado durante el análisis. Se utiliza por separado del script.

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

### 1. Menciona los tipos de protocolos de red.

Los protocolos de red se pueden clasificar de acuerdo con la función que realizan. Algunos de los principales son:

* **Protocolos de comunicación:** TCP, UDP e IP.
* **Protocolos de aplicación:** HTTP, HTTPS, FTP, SMTP y DNS.
* **Protocolos de enrutamiento:** RIP, OSPF y BGP.
* **Protocolos de configuración y administración:** DHCP, SNMP y SSH.
* **Protocolos de resolución de direcciones:** ARP.

También pueden clasificarse de acuerdo con la capa del modelo OSI a la que pertenecen. Algunos ejemplos son:

* **Protocolos de Enlace/Red:** Ethernet, ARP, IP (IPv4, IPv6) e ICMP.
* **Protocolos de Transporte:** TCP y UDP.
* **Protocolos de Aplicación:** HTTP/HTTPS, DNS, FTP, SSH, SMTP, POP3, IMAP y DHCP.

### 2. Respecto a la pregunta anterior, ¿cómo funcionan? ¿Para qué sirven?

Los protocolos de red establecen las reglas que permiten que diferentes dispositivos puedan comunicarse entre sí. Cada protocolo tiene una función específica dentro de la comunicación.

* **IP:** se encarga del direccionamiento y de llevar los paquetes hacia su destino.
* **TCP:** permite una comunicación confiable y verifica que los datos lleguen correctamente.
* **UDP:** permite enviar datos sin establecer una conexión y con menor sobrecarga.
* **DNS:** relaciona nombres de dominio con direcciones IP.
* **HTTP y HTTPS:** permiten la comunicación entre clientes y servidores web.
* **DHCP:** asigna automáticamente configuraciones de red a los dispositivos.
* **SSH:** permite administrar equipos de manera remota y segura.
* **SMTP:** se utiliza para el envío de correos electrónicos.

En ciberseguridad, conocer estos protocolos ayuda a entender cómo funciona una red y qué servicios pueden estar expuestos.

### 3. ¿Qué es un sniffer?

Un sniffer es una herramienta que permite capturar y analizar los paquetes que circulan por una red. Puede proporcionar información sobre las direcciones IP, puertos, protocolos y otros datos relacionados con las comunicaciones.

Se utiliza principalmente para analizar el tráfico de red, detectar problemas de comunicación y apoyar en la investigación de incidentes de seguridad. Su uso debe realizarse únicamente sobre redes o sistemas donde se tenga autorización.

### 4. ¿Qué significa OSINT? ¿Para qué sirve?

OSINT significa **Open Source Intelligence** o **Inteligencia de Fuentes Abiertas**. Consiste en recopilar, organizar y analizar información que se encuentra disponible públicamente.

En ciberseguridad se utiliza principalmente durante la etapa de reconocimiento, ya que permite obtener información sobre un objetivo antes de realizar otras pruebas de seguridad. Puede ayudar a identificar dominios, subdominios, direcciones IP, registros DNS, tecnologías utilizadas y otros datos que estén disponibles públicamente.

También puede utilizar información proveniente de redes sociales, bases de datos públicas, foros y registros gubernamentales con el objetivo de generar información útil durante las etapas tempranas de un pentest, incluso sin interactuar directamente con el objetivo.

### 5. Investiga los 5 OSINT más usados.

Algunas herramientas de OSINT que son ampliamente conocidas y utilizadas en ciberseguridad son:

1. **Maltego:** permite relacionar y visualizar información obtenida de diferentes fuentes.
2. **Shodan:** permite buscar dispositivos y servicios que están expuestos en Internet.
3. **Recon-ng:** framework que facilita la recopilación de información durante una investigación.
4. **SpiderFoot:** automatiza la recopilación de información sobre diferentes tipos de objetivos.
5. **theHarvester:** permite recopilar información pública relacionada con dominios, correos electrónicos, subdominios y otros datos.

No existe una clasificación universal que determine cuáles son exactamente las cinco herramientas más utilizadas, por lo que esta lista considera herramientas ampliamente conocidas dentro del área de OSINT y reconocimiento.

### 6. Investiga 5 softwares no mencionados en la práctica que sirvan para el análisis de comunicaciones.

Cinco herramientas que pueden utilizarse para analizar comunicaciones y tráfico de red son:

1. **Wireshark:** permite capturar y analizar paquetes de red.
2. **TShark:** herramienta de línea de comandos para analizar tráfico de red.
3. **Zeek:** permite monitorear redes y generar información sobre las comunicaciones que ocurren en ellas.
4. **Suricata:** sistema de detección y prevención de intrusiones que analiza el tráfico de red.
5. **tcpdump:** herramienta de línea de comandos utilizada para capturar y analizar paquetes.

Estas herramientas permiten observar distintos aspectos de las comunicaciones, desde la captura directa de paquetes hasta el monitoreo y detección de actividad potencialmente maliciosa.

### 7. ¿Por qué se considera a las personas como el eslabón más débil de seguridad?

Las personas pueden convertirse en un punto vulnerable porque muchas amenazas dependen de errores o decisiones del usuario. Algunas situaciones pueden facilitar un ataque, como utilizar contraseñas débiles, reutilizar credenciales, abrir archivos sospechosos o compartir información confidencial.

Por esta razón, la seguridad no depende solamente de las herramientas técnicas. También es necesario que los usuarios conozcan los riesgos y sigan buenas prácticas de seguridad.

### 8. ¿Qué acciones haces para protegerte de ciberataques?

Para protegerme de ciberataques intento utilizar contraseñas diferentes para mis cuentas importantes y activar la autenticación multifactor. Evito acceder a enlaces o archivos sospechosos y procuro verificar los sitios antes de ingresar información.

### 9. ¿Crees que tus métodos preventivos son suficientes?

Considero que mis medidas preventivas ayudan a reducir los riesgos, pero no son suficientes porque cada vez hay nuevas vulnerabilidades.

La seguridad debe verse como un proceso continuo en el que se combinan buenas prácticas, herramientas de protección y conocimiento sobre las amenazas.

## Secciones:

**Requisitos:**
El problema que se quiere resolver en esta fase es perfilar la superficie de ataque externa de un objetivo (ya sea un dominio o una IP). Se busca conocer qué infraestructura tiene expuesta en internet, quiénes son los contactos administrativos y qué servicios están corriendo para posteriormente buscar fallas.
Para llevar a cabo esto de forma ética y profesional, se deben cumplir ciertos requisitos:Una prueba de penetración es una evaluación en la que se emplean técnicas de adversarios para identificar vulnerabilidades. Para ejecutar estas acciones de forma legítima, es obligatorio contar con una autorización correspondiente.   Esta autorización se define como un permiso válido, claro y verificable.   Se debe definir un alcance claro, el cual establece los límites dentro de los cuales se puede realizar la evaluación.   El alcance detalla qué direcciones IP, redes y aplicaciones forman parte de la prueba y cuáles quedan expresamente excluidas.

**Identificación de fuentes de información:**
Las fuentes de información que aportan datos valiosos y veraces para esta fase provienen tanto de registros públicos como de interacción directa con los servidores:

* Bases de datos de registros (WHOIS): Aportan fechas de creación, expiración, dueños y correos de contacto.

* Servidores DNS públicos: Proveen resolución de nombres, direcciones IPv4/IPv6, servidores de correo (MX) y transferencias de zona.

* Fuentes de Inteligencia de Código Abierto (OSINT): Utilizadas por herramientas como subfinder y sublist3r para rastrear subdominios indexados en motores de búsqueda o certificados SSL públicos.

* Interacción de red: Respuestas de los propios servidores del objetivo mediante paquetes ICMP (ping), escaneo de puertos TCP/UDP (nmap) y rutas (traceroute).

**Adquisición:** En esta etapa se utiliza el script en bash t1.sh para recolectar la información de manera automatizada.
Explicación del script:

Validación de entrada: El script verifica que se pase un dominio o IP como argumento ($1).

Consultas a Registros (WHOIS): Ejecuta el comando whois y, mediante expresiones regulares (grep -Ei), extrae específicamente fechas (creación, actualización), correos, organización, país, estado y números de teléfono.

Pruebas de Conectividad: Realiza un ping de 4 paquetes, extrayendo el porcentaje de pérdida y formateando la latencia promedio mediante awk.

Análisis de Ruta: Usa traceroute para encontrar los saltos hasta el servidor.

Diferenciación IP/Dominio: Mediante una expresión regular, el script determina si la entrada es un dominio o una IP. Si es IP, omite las búsquedas de subdominios. Si es dominio, extrae las IPs correspondientes con nslookup.

Enumeración de DNS y Subdominios: Si es un dominio, se realizan consultas para los registros A, AAAA, NS, MX y SOA. Posteriormente, lanza findomain, sublist3r y subfinder para enumerar subdominios, seguido de dnsrecon y dnsmap.

Escaneo de Puertos: Finalmente, ejecuta nmap -sV para detectar qué puertos están abiertos y qué versiones de servicios se están ejecutando.

**Procesamiento:**
El script toma toda la información en crudo obtenida en la fase de adquisición (que suele ser ruidosa y larga) y le da formato estructurado utilizando comandos como grep, awk y head. Todo este formato limpio se almacena en variables de bash.
Al final, utiliza un bloque echo que redirige (>) el texto ordenado por secciones (WHOIS, CONECTIVIDAD, DNS, SUBDOMINIOS, NMAP, etc.) a un archivo .txt cuyo nombre se genera dinámicamente sustituyendo diagonales por guiones bajos. Esto permite que el analista lea de manera amigable los resultados sin tener que ejecutar comando por comando.

**Análisis:** El script toma toda la información en crudo obtenida en la fase de adquisición (que suele ser ruidosa y larga) y le da formato estructurado utilizando comandos como grep, awk y head. Todo este formato limpio se almacena en variables de bash.
Al final, utiliza un bloque echo que redirige (>) el texto ordenado por secciones (WHOIS, CONECTIVIDAD, DNS, SUBDOMINIOS, NMAP, etc.) a un archivo .txt cuyo nombre se genera dinámicamente sustituyendo diagonales por guiones bajos. Esto permite que el analista lea de manera amigable los resultados sin tener que ejecutar comando por comando.

**Propuestas:** En esta fase se generan datos de inteligencia cruzando la información formateada. Por ejemplo, al relacionar los correos obtenidos en WHOIS con los subdominios vulnerables descubiertos por dnsrecon, o al analizar las versiones desactualizadas de servicios arrojadas por nmap.Durante este análisis, se deben tener presentes consideraciones éticas:Herramientas como Nmap y scripts de enumeración tienen un uso dual, ya que pueden servir tanto para propósitos beneficiosos (mejorar la seguridad) como para realizar ataques.   El carácter ético de utilizar este script depende de la finalidad, la autorización y el contexto.   Si al analizar los resultados se descubre accidentalmente una vulnerabilidad crítica, se debe realizar un proceso de divulgación responsable.   Esto requiere confirmar la vulnerabilidad sin aumentar el daño.   También exige documentar los hechos con precisión y utilizar el canal adecuado para escalar el problema de manera proporcional.

## Referencias

LaNMaSteR53. (s. f.). *Recon-ng*. GitHub. https://github.com/lanmaster53/recon-ng

Maltego Technologies. (s. f.). *What is Maltego?* Maltego Support. https://support.maltego.com/

National Institute of Standards and Technology. (2008). *Technical guide to information security testing and assessment* (Special Publication 800-115). https://doi.org/10.6028/NIST.SP.800-115

National Institute of Standards and Technology. (s. f.). *Packet sniffer*. CSRC. https://csrc.nist.gov/glossary/term/packet_sniffer

Shodan. (s. f.). *What is Shodan?* https://help.shodan.io/the-basics/what-is-shodan

Suricata. (s. f.). *Suricata*. https://suricata.io/

Wireshark Foundation. (s. f.). *Wireshark user’s guide*. https://www.wireshark.org/docs/wsug_html/

Zeek Project. (s. f.). *About Zeek*. https://docs.zeek.org/en/current/about.html
