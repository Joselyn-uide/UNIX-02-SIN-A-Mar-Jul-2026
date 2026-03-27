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
gpg --decrypt MICOMPA_doc_cifrado.txt #descifra el archivo protegido enviado por mi compañera, solicitando mi contraseña privada para revelar el mensaje original en la pantalla.
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt #This command generates a new file (doc_no_cifrado_firmado.txt) that contains the original text of the document in a readable format along with a digital signature (clearsign).
cat doc_no_cifrado_firmado.txt #It displays the complete contents of the file in the terminal, allowing you to see both the original text and the digital signature block.
gpg --verify MICOMPA_doc_no_cifrado_firmado.txt #This command validates the digital signature of the file to confirm the identity of the sender.
gpg --edit-key pametoapanta.502@gmail.com #This command allows you to enter the key editing menu (identified by email or hash) to grant a level of trust 4 ("I fully trust"), thus integrating my partner into my Web of Trust.
gpg --sign-key pametoapanta.502@gmail.com #This command digitally signs my colleague's key with mine to publicly validate its authenticity and strengthen trust in the Web of Trust system.
gpg --verify MICOMPA_doc_no_cifrado_firmado.txt #This command checks the document to ensure that my colleague's signature is valid and that the file has not been modified by anyone else.
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt # This command compresses and signs the document in a binary format, which protects the integrity of the file but prevents reading its contents directly without using GPG.
gpg --verify MICOMPA_doc_no_cifrado_firmado_binario.txt #This command analyzes the packaged file to confirm that my colleague's digital signature is valid and that the binary data has not been altered.
gpg --output firma_separada_doc_no_cifrado.sig --detach-sign doc_no_cifrado.txt #This command creates a separate file (.sig) containing only the digital signature, allowing you to validate the original document without modifying it. Two files are generated: the original document intact and the separate signature.
gpg --verify MICOMPA_firma_separada_doc_no_cifrado.sig MICOMPA_doc_no_cifrado.txt #This command compares the separate signature file with the original document to confirm that the content is authentic and was signed by my colleague.
gpg --output doc_cifrado_y_firmado.txt --encrypt --sign --recipient pametoapanta.502@gmail.com doc_no_cifrado.txt #This command applies a digital signature (with my key) and encryption (with my partner's key), ensuring that only she can read the message and that she is certain that I sent it.