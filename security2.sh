# View current main group 
id

#only the main group name
id -gn
#Create a file and see which group inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
# The group is the user's primary group

# View the current group
id -gn
echo "Grupo actual: $(id -gn)"
# Create a file before newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt


# Update repositories and upgrade system packages
apt update && apt upgrade -y
# Install the required package for the newgrp command
apt install util-linux-extra -y
# Refresh the Zsh shell command cache
rehash
# Create the new group in the system
groupadd desarrolladores
# Switch to the 'developers' group
newgrp desarrolladores
# Verify that the active group has changed
id -gn
echo "Nuevo grupo activo: $(id -gn)"

# Create a file within the subshell.
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# The group is now 'desarrolladores'.
# Create a directory.
mkdir -p ~/proyecto_dev/src
ls -la ~/


# project_dev/ has a group 'desarrolladores'
# Exit the newgrp subshell
exit
# Verify that we are back in the original group
id -gn
echo "Grupo restaurado:$(id -gn)"


# Compare the two files
ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt