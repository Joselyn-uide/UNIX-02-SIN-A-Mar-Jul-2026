# umask 022: Sets the default mask (at that time new files came out as 644).
umask 022
# touch archivo1: Creates an empty file named archivo1 using the current mask.
touch archivo1
# mkdir directory1: Creates a folder named directory1 using the current mask.
mkdir directory1
# ls -l: Lists the files and folders with details (here we notice that the permissions were ignoring the umask because it was in a folder with ACLs).
ls -l

# umask 027: Changes the mask to make new files more private (restricts to the group and others). 
umask 027
# touch archivo2: Creates file2, but initially exited with incorrect permissions due to the previous location.
touch archivo2
# mkdir directory2: Creates directory2, also with incorrect permissions initially for the same reason.
mkdir directory2
# rm archivo2 && rmdir directorio2: Deletes both elements so they can be recreated from scratch with the correct mask.
rm archivo2 && rmdir directorio2
# cd ~: Moves you to your home directory, where there are no interfering network rules or ACLs.
cd ~
# umask 027: Ensures that the desired mask is active in this new location.
umask 027
# touch archivo2: Creates the file again, this time applying permissions 640.
touch archivo2
#mkdir directorio2: Creates the directory again, this time applying permissions 750.
mkdir directorio2
#ls -l: Displays the final result, confirming that the permissions are now correct.
ls -l


# umask 077: Sets a restrictive mask that removes all permissions for the group and others (only the owner has access).
umask 077
#touch secreto.txt: Creates a file called secreto.txt applying the new mask 077.
touch secreto.txt
#mkdir privado: Creates a directory called privado applying the new mask 077.
mkdir privado
#ls -l: Lists the files to verify that secreto.txt has -rw------- permissions and privado has drwx------.
ls -l

#UMASK
# The umask (user mask) is a system command and value that determines the default permissions assigned to any file or directory at the time of its creation. It acts as a filter that "subtracts" or masks permissions from a predefined base (usually 666 for files and 777 for directories), allowing users to automatically control the privacy of their new data without having to manually modify each item. In short, the higher the mask number, the more restrictive the resulting permissions will be for the group and other users.