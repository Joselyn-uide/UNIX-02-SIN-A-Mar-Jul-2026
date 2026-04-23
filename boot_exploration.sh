#Anatomy of a UNIX command  ---  command [options] [arguments]
#The ls -lah command is used to list all the contents of a directory, including hidden files (-a), displaying technical details such as permissions and dates in long list format (-l), and transforming file sizes into readable units such as KB or MB (-h) for easier reading.
ls -l -a -h
ls -lah

#Create a directory whose name is literally -rf (the use of -- tells Linux that what follows is not an option or parameter, but the name of the folder).
mkdir -- -rf
#Delete an empty directory that is named exactly -rf.
rmdir -- -rf

#It shows a quick and summarized guide to all the options and parameters you can use with the ls command (like the ones we saw for -lah).
ls --help
#Open the official and detailed manual for the ls command, explaining in detail each function, permissions, and output formats.
man ls
#Displays the main Git manual, which serves as an index to understand how repositories work and how to access help for specific subcommands (such as man git-commit).
man git
#To navigate efficiently in the manual (man), use the / key followed by the term you wish to locate; once the search has started, press n to jump to the next match forward or N to return to the previous one in the opposite direction.
man git-clone #We are looking for what --depth does:Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.


#To create a file from the terminal, use touch.
#Grants execution permissions to all users (owner, group, and others) for the script.sh file.
chmod +x script.sh 
# Assign execution permission only to the user (u) who owns the file.
chmod u+x script.sh
# Removes (-) read permission (r) from "others" (o), that is, any user who is not the owner or group of the file.
chmod o-r secreto.txt
#Configure the private file so that the owner has read and write access (u+rw), while the group and the rest of the world lose absolutely all access (go-rwx).
chmod u+rw,go-rwx privado

#This command fails with a "Permission denied" error. This happens because sudo only grants superuser privileges to the echo command, but the redirection symbol (>) is executed by your normal user, which does not have permission to write to the /etc directory.
sudo echo "hola" > /etc/archivo_protegido
#In this commando, echo runs as a normal user, but passes the text via a pipe (|) to the tee command, which does have sudo privileges. The addition of > /dev/null prevents the text from being printed to the screen, making the process silent.
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null
#List all the files and folders within the /etc directory, which is where almost all of your Linux system's global settings are stored.
ls /etc
#Attempt to read and display the file contents; if the file has restricted permissions, you may need to prepend sudo to view it.
cat /etc/archivo_protegido
#This command performs a double data output; first, it uses sudo tee to write the text "hello" into the protected system file and, simultaneously, displays it through the terminal (standard output).
echo "hola" | sudo tee /etc/archivo_protegido
#Run a command interpreter (sh) with administrator privileges (sudo) to write the text "chao" to the end of a protected file, without overwriting it.
sudo sh -c 'echo "chao" >> /etc/archivo_protegido'