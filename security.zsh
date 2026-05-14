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


#groups: Shows the groups to which the current user belongs.
#groupadd group_test: Creates a new group on the system called group_test.
#groups (repeated): Note that only root is still shown here. This is because although the group exists, the root user has not yet been added to it.
#cat /etc/group: This command displays the file where all the system groups are stored.
#touch comun: Creates an empty file called common.
#ls -l comun: Checks the permissions. As you can see, the file is created belonging to the root user and the root group, which is the default behavior.


# usermod -a -G grupo_test luna: This command modifies the user luna.
#-a (add): This means "add." It's vital because it prevents the user from being removed from their other groups.
#-G: Indicates that you'll be working with secondary groups.
usermod -a -G grupo_test luna
#chgrp grupo_test común: Uses the Change Group command. You changed the group associated with the file común (which was previously root) to grupo_test.
chgrp grupo_test comun
#ls -l común: You listed the file to confirm the changes.. The output -rw-r--r-- 1 root grupo_test confirms that any member of grupo_test (like luna) is now subject to the group permissions of that file.
ls -l comun

#chown luna:grupo_test mi_archivo: Simultaneously changes the owner to `luna` and the group to `grupo_test` of the specified file.
chown luna:group_test mi_archivo
# ls -l mi_archivo`: Displays detailed file attributes to verify that the new owner and group were applied correctly
ls -l mi_archivo

#mkdir -p project/sub: Creates a nested folder structure; the `-p` parameter ensures that the parent directory (`project`) and the child directory (`sub`) are created simultaneously.
mkdir -p project/sub
#touch project/readme project/sub/data: Creates two empty files at different levels of the newly created structure.
touch project/readme project/sub/data
#chown -R luna:grupo_test proyecto: Changes the owner and group of the project folder and all its contents (files and subfolders) recursively using the `-R` parameter.
chown -R luna
#ls -lR project: Recursively displays the contents of the project and all its subfolders to verify that the change of ownership was applied at all levels.
ls -lR project

#User ID (numeric), primary group, secondary groups
id
#View all system users (indicates who has a password)
cat /etc/passwd | head -10