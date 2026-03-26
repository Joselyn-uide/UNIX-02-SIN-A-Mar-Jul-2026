uname -a #daba información de la computadora u ordenador
which gpg #muestra la ubicación del binario de gpg
gpg --version #muestra la versión de gpg e información adicional
gpg --full-generate-key #genero la llave publica y privada
gpg --list-keys #exportar el llavero
gpg --armor --export #exportar la llave pública
gpg --list-secret-keys --keyid-format=long  #lista las llaves privadas