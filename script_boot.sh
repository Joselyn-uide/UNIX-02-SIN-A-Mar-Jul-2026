#Create a new folder (directory) called "project"
mkdir proyecto
# The command cd project/ allows you to enter the "project" folder, and a relative path is one that defines a location based on your current directory rather than starting from the system root.
cd proyecto/
#The command moves you directly to that specific folder, and an absolute path is the complete and exact address of a file or folder from the system root (the origin /), regardless of which directory you are working in.
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto

#CHANGE DIRECTORY (/home)
# The cd command instantly returns you to your home directory (/home/username)
cd
#The command cd ~ takes us directly to the home directory.
cd ~ 
#The command `cd /home/codespace` takes us directly to the user's specific folder "codespace" using its absolute path, ensuring we reach that exact destination no matter where we are navigating in the system.
cd /home/codespace
#Environment variables
#The command cd $HOME uses an environment variable called $HOME to automatically take you to your user folder.
cd $HOME
#The echo $HOME command prints the full path of the home directory to the screen, allowing you to view the value stored in that specific system environment variable.
echo $HOME
#The command `echo $BASH` displays the absolute path to the Bash executable on the screen.
echo $BASH
#The echo $PATH command displays a colon-separated list of directories where the system looks for executable programs when you type a command without specifying its full path.
echo $PATH
#The command cd /usr/local places you in a standard UNIX hierarchy directory intended for programs and data installed locally by the administrator, outside of the main operating system files.
cd /usr/local

#The ls -lai command lists all files (including hidden ones) showing their index (inode) number, detailed permissions, and size in a vertical list format. 
ls -lai
#The command ls -l -a -i is the extended equivalent of ls -lai, and displays all files (including hidden ones) in detailed list format, preceding each one with its inode number (unique identifier in the file system).
ls -l -a -i
# The man ls command opens the system's electronic manual for the ls command, providing detailed documentation on its usage, syntax, and all the options or "flags" available to modify its behavior.
man ls
#The command ls --all is the long version of the ls -a command, and is used to list absolutely all files and directories, including hidden ones that begin with a dot (.).
ls --all
#The command ls -a lists all files and folders in the current directory, including hidden files that begin with a dot (.), such as configuration files.
ls -a
#Results ls -a: The dot (.) represents the current directory and the colon (..) represents the parent directory (the top level).

total 8
1572971 drwxrwxrwx+ 2 codespace codespace 4096 Apr  9 12:19 .
1572874 drwxrwxrwx+ 5 codespace root      4096 Apr  9 12:19 ..
#total 8: total disk space (measured in file system blocks) occupied by the metadata and entries of the listed directories.
#1572971: This is the inode number, a unique identifier assigned by the file system to that specific object.
#drwxrwxrwx+: This indicates the file type and permissions. The 'd' means it's a directory; the following letters are read (r), write (w), and execute (x) permissions for the owner, group, and others; the '+' indicates additional Access Control Lists (ACLs).
#2: This is the number of hard links pointing to this directory.
#codespace (first): This is the username of the file or directory owner.
#codespace (second): This is the name of the group the file belongs to.
#4096: This represents the file size or directory metadata in bytes.
#Apr 9 12:19: This is the date and time of the last modification.
#.: The trailing dot represents the current directory.
