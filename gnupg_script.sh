uname -a #daba información de la computadora u ordenador
which gpg #muestra la ubicación del binario de gpg
gpg --version #muestra la versión de gpg e información adicional
gpg --full-generate-key #genero la llave publica y privada
gpg --list-keys #exportar el llavero
gpg --armor --export #exportar la llave pública
gpg --list-secret-keys --keyid-format=long  #lista las llaves privadas
gpg --armor --export-secret-keys XXXXXXXX #exporta la llave privada en formato de texto ASCII (las X representan el hash)
gpg --armor --export jolagunapu@uide.edu.ec > mi_llave_publica.asc   #se exporta la llave pública con el correo registrado
gpg --import Pame.asc #importamos la llave pública que nos han compartido
echo "Hola Pame, este mensaje es top secret" > doc_no_cifrado.txt #crea un archivo de texto llamado doc_no_cifrado.txt que contiene el mensaje "Hola Pame, este mensaje es top secret"
gpg --output doc_cifrado.txt --encrypt --recipient pamelatoapanta.502Q@gmail.com doc_no_cifrado.txt #cifra el archivo doc_no_cifrado.txt utilizando la llave pública de mi compañera para que solo ella pueda leer su contenido.