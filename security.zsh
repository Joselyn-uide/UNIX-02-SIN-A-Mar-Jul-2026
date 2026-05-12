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