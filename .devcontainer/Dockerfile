# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.

# ----------------------------------------------------------------------------
# BLOCK A: Defining the Base Image and Selecting the Kali Linux Distribution
# ----------------------------------------------------------------------------
# The FROM instruction is the starting point in any Dockerfile and defines 
# what is known as the base image. A base image is the initial, clean, and 
# pre-configured operating system on which the entire virtualized 
# environment will be built. The kalilinux/kali-rolling distribution is 
# specifically selected because Kali is the industry standard in 
# cybersecurity and penetration testing. By choosing this base, we ensure 
# that the container inherits an optimized ecosystem with security 
# repositories ready for auditing systems, which aligns with the methodology 
# for preparing efficient and isolated hacking labs through secure dependency
# bundling (— BHB Chapter 3). Furthermore, the book emphasizes that to 
# natively run practical labs and offensive shell commands without altering 
# our host system, a Kali Linux-based environment is essential (— BHB Chapter 1).

FROM kalilinux/kali-rolling:latest


# ------------------------------------------------------------------------------
# BLOCK B: Image, Layer, and Cache Concepts
# ------------------------------------------------------------------------------
# Building a Docker environment is done progressively by storing individual 
# fixed blocks, where each instruction in the configuration file generates a 
# permanent record. The system saves these blocks in local temporary memory to 
# speed up processes. This way, when powering up or shutting down lab components 
# for safety testing, the repetitive downloading of unchanged elements is 
# avoided, ensuring a clean and consistent environment (— BHB Chapter 3). 
# Because this memory operates in a top-down sequence, the visual organization 
# and position of the lines of code become critical. If an instruction located 
# at the beginning of the document is altered, this storage chain is completely 
# broken, forcing the reprocessing of each subsequent step and delaying the 
# deployment of the automated environment (— BHB Chapter 3). For this reason, 
# it is recommended to place fixed and permanent parameters at the top.

# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.

# ----------------------------------------------------------------------------
# BLOCK C: Environment Variable (ENV) configuration for container customization
# and operation
# ----------------------------------------------------------------------------
# The ENV instruction is used to declare permanent environment variables 
# within the container. The command interpreter automatically loads and 
# processes this set of global variables in each new session invoked, 
# allowing system tools to adapt their dynamic behavior at runtime (— BHB Ch. 1).

# - By defining DEBIAN_FRONTEND=noninteractive, we instruct the package manager 
# to suppress any graphical menus that require our intervention.

# - Configuring LANG=es_EC.UTF-8 and LC_ALL=es_EC.UTF-8 forces the operating 
# system to use the Spanish localization and language of Ecuador with Unicode 
# universal encoding.

# - Finally, TERM=xterm-256color tells the system the type of terminal it is 
# emulating, allowing console tools and text editors to have a 256-color palette, 
# which is vital to avoid mistakes when coding scripts (— BHB Ch. 1).


ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.

# ----------------------------------------------------------------------------
# BLOCK D: Automating Responses with debconf-set-selections
# ----------------------------------------------------------------------------
# During the installation of programs like Wireshark on Linux, security 
# permission prompts may appear requiring user intervention. In Docker 
# environments, this causes problems because execution is automatic and cannot 
# respond to these requests, resulting in the process halting. To avoid this, 
# debconf-set-selections is used. The echo command writes the desired response
# and, through the pipe (|), passes it directly to the debconf-set-selections 
# tool. This tool allows you to predefine the responses before installation. 


RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).

# -----------------------------------------------------------------------
# BLOCK E: Updating, Installing, and Configuring Container Tools
# -----------------------------------------------------------------------
# Update vs. Install: apt-get update updates the list of available 
# packages on the servers, while apt-get install downloads and installs 
# the selected programs (— BHB Chapter 3).

# The -y option automatically accepts all confirmations to avoid 
# interruptions during installation (— BHB Chapter 3). Meanwhile, 
# --no-install-recommends prevents the download of optional packages, 
# installing only the essential components.

# In Docker, each RUN creates an independent layer. Unifying update, 
# installation, and cleanup into a single block prevents temporary files 
# from being stored in intermediate layers, significantly reducing the 
# final image size.

# The && operator executes the next command only if the previous one 
# completes successfully. The backslash \ allows you to split a long 
# instruction into multiple lines to improve readability without 
# affecting its functionality.

# INSTALLED TOOLS
# 1. Text editors and shells (neovim, vim, zsh, bash-completion): These 
# provide a working environment for programming, editing configurations,
# and managing systems from the terminal (— BHB Chapter 1).

# 2. Text processing tools (perl, make, gawk, sed, grep): These utilities
# allow you to search for specific text patterns, modify words within 
# files, or extract snippets of information without needing to open a 
# manual editor (— BHB Chapter 2).
    # - grep: Used to filter lines of text containing a word of interest 
    # within a large volume of data (— BHB Chapter 2).
    # - sed: A stream editor that automatically modifies or cleans text 
    # on the fly (— BHB Chapter 2).
    # - gawk (or awk): Works as a processor that analyzes column-structured 
    # files to extract specific data (— BHB Chapter 2).

# 3. Basic UNIX utilities (coreutils, findutils, procps, less, tree, jq): 
# These provide essential tools for system administration. coreutils 
# manages files and directories, findutils performs searches, procps 
# controls processes, less displays text files, and tree shows the folder structure.
    #- jq: This is a specialized tool for interpreting and formatting 
    # complex blocks of data structured in JSON format, which are obtained 
    # from web queries (— BHB Chapter 3).

# 4. Manual pages (man-db, manpages, manpages-posix): These provide the 
# technical documentation needed to consult advanced commands and options (— BHB Chapter 1).

# 5. Basic networking, downloads, and script validation (curl, wget, git, 
# git-lfs, ca-certificates, locales, shellcheck): These provide the necessary 
# tools for obtaining resources from the internet, managing code repositories, 
# and ensuring secure connections using digital certificates. Furthermore, 
# shellcheck allows the detection of errors and bad practices in scripts 
# before execution, facilitating the development and maintenance of the environment.
    # - curl and wget allow you to make web requests and download files 
    # from a URL, while httpie offers a more modern and user-friendly 
    # alternative for interacting with web services (— BHB Chapter 3).

# 6. Network reconnaissance, scanning, and capture (nmap, masscan, tcpdump, 
# tshark): Tools used in security audits to discover devices, identify exposed
# services, and analyze network traffic. nmap and masscan allow you to scan 
# hosts and ports, while tcpdump and tshark facilitate real-time packet capture
# and inspection (— BHB Chapters 2 and 3).

# 7. Network and anonymity utilities (netcat-traditional, socat, tor, 
# proxychains4, obfs4proxy, etc.): Facilitate network communication and testing
# while maintaining a certain level of anonymity. netcat-traditional allows you
# to create direct connections between computers, socat links and redirects 
# different types of connections and sockets, tor anonymizes traffic through a 
# distributed network, proxychains4 routes applications through one or more 
# proxies, and obfs4proxy hides the use of Tor to make it harder for monitoring 
# systems to detect.

# The block concludes by enabling Spanish localization using sed -i and 
# locale-gen. Afterward, apt-get clean and the removal of /var/lib/apt/lists/* 
# delete temporary files and installation indexes to reduce the final size of 
# the container and optimize its storage.

RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.

# ----------------------------------------------------------------------
# BLOCK F: Activating the Spanish Language in the Container 
# ----------------------------------------------------------------------
# Using the sed -i command, we modify the internal file /etc/locale.gen
# to find the rule for the Ecuadorian language (# es_EC.UTF-8 UTF-8) 
# and remove the # symbol that was blocking it. This tool follows the 
# strategy described in the manual for automatically editing text streams 
# using specific patterns to clean or restructure system files (-BHB 
# Chapter 2). Afterward, the `locale-gen` command processes this change 
# and compiles the necessary language packages, enabling our terminal to
# natively recognize Ecuadorian Spanish.

 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.

# ---------------------------------------------------------------------------
# BLOCK G: Image cleaning and optimization
# ---------------------------------------------------------------------------
# Deleting binary installers and temporary download logs within the same RUN
# instruction is essential due to Docker's immutable layer structure; if done
# in a later step, these unnecessary items remain indexed and permanently 
# frozen in the container's history, occupying hidden space (— BHB Ch. 3). 

 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).

# ----------------------------------------------------------------------------
# BLOCK H: Configuring SHELL in Docker
# ----------------------------------------------------------------------------
# The SHELL instruction changes Docker's default interpreter (/bin/sh, which 
# is outdated and limited) to /bin/bash to take advantage of the advanced 
# tools, arrays, and complex automations it offers on Linux systems (— BHB 
# Chapter 1). Within this declaration, the -c (code or command) option is a 
# crucial flag that instructs Bash to strictly read, process, and execute the
# subsequent instructions written in the RUN block as if they were a 
# continuous string of text, thus allowing the cybersecurity lab tools to be 
# configured correctly and without interruption (— BHB Chapter 1).

SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.

# ----------------------------------------------------------------------------
# BLOCK I: Establishment of the Work Directory (WORKDIR)
# ----------------------------------------------------------------------------
# The WORKDIR command sets the default working directory where subsequent 
# commands will be executed. It functions similarly to the Linux cd command, 
# changing the system's active location and updating the $PWD variable (— BHB 
# Chapter 1). In GitHub Codespaces, it's set to /workspaces because the project 
# repository is automatically stored there. This allows terminals and scripts 
# to start directly in the working directory, simplifying file access and 
# avoiding manual directory changes (— BHB Chapter 3).

WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.

# ----------------------------------------------------------------------------
# BLOCK J: Git settings for the container
# ----------------------------------------------------------------------------
# This block configures Git to facilitate working within the container. The
# safe.directory option '*' allows Git to seamlessly recognize and use project
# folders mounted from the host system. init.defaultBranch main sets main as 
# the default name for new branches, while `pull.rebase false` causes Git to 
# combine changes using the traditional merge method when performing a pull. 
# Finally, `git lfs install --system` enables support for Git LFS, a tool that 
# allows for more efficient management of large files within repositories 
# (- BHB Chapter 3).

RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Prompt del curso para bash

RUN chsh -s /usr/bin/zsh root

RUN cat >> /root/.zshrc <<'EOF'

PROMPT='%F{cyan}[Joselyn-Laguna]%f %F{yellow}%1~%f %(?.%F{green}√.%F{red}X %?)%f %# '
EOF

CMD ["/usr/bin/zsh"]