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