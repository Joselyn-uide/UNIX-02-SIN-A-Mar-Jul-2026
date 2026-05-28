#View current main group 
id

#only the main group name
id -gn
#Create a file and see which group inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
# The group is the user's primary group