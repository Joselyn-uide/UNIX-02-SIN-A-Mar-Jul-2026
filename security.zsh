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

# `chown` (change owner) and `chgrp` (change group) are used to manage the ownership of files and directories. `chown` allows you to change the user who owns an item, which is essential for transferring control of a file to another person; it's also a versatile command that can simultaneously change the group. `chgrp`, on the other hand, specializes exclusively in modifying the owning group. Both commands are essential administration tools for defining who the legal "owner" of the data is and, therefore, to whom the previously defined permission rules (read, write, and execute) will apply.
# whoami: This command returns the name of the user you are currently working as. In your case, it returned root, which is the superuser with full control over the system.
whoami
# echo "Hello" > my_file: Creates a new file called my_file with the text "Hello" inside. Since it was created by root, it initially belongs to them.
echo "Hello" > my_file
# ls -l my_file: Displays the file details. Here you confirmed that the owner was root and the group was also root (-rw-r--r-- 1 root root).
ls -l my_file
# useradd -m -s /usr/bin/zsh luna: This is an administrative command that creates a new user on the system called luna.
useradd -m -s /usr/bin/zsh luna
#- The -m parameter automatically creates their home directory (/home/luna).
#- The -m parameter automatically creates their home directory (/home/luna). The `-s /usr/bin/zsh` parameter assigns the Zsh shell as your default command interpreter.
#`chown luna my_file`: Here you used the `Change Owner` command. You changed the file's ownership so that the owner is now the user `luna`, removing ownership from `root`.
`chown luna my_file`
#`ls -l my_file`: You listed the file again to verify the change. The final output shows `-rw-r--r-- 1 luna root`, confirming that `luna` is now the owner, although the group remains `root`.
`ls -l my_file`