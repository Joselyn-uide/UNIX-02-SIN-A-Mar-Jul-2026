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


#The stat . command shows much more detailed information than ls about the current directory (the dot).
stat .
#Device: 7,4 identifies the hardware or disk partition where the file resides, using two numbers represented in hexadecimal or decimal format:
#7 (Major number): Identifies the type of device or driver that the Linux kernel uses to communicate with the hardware. In this case, 7 usually corresponds to a loop device (a virtual device that allows mounting files as if they were disks).
#4 (Minor number): Identifies the specific instance or partition within that type of device. Here, it indicates that it is the fourth unit (or partition) managed by that driver.
 File: .
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 7,4     Inode: 1572971     Links: 2
Access: (0777/drwxrwxrwx)  Uid: ( 1000/codespace)   Gid: ( 1000/codespace)
Access: 2026-04-09 12:19:03.530081788 +0000
Modify: 2026-04-09 12:19:02.215081727 +0000
Change: 2026-04-09 12:19:02.215081727 +0000
 Birth: 2026-04-09 12:19:02.215081727 +0000

#The `ls -lt` command sorts files by their modification date and time, displaying the most recent files first in a detailed list format. In our case, it shows 0 because we haven't created any files.
ls -lt
#This command lists the contents of the /etc directory and, using a pipe (|), sends that output to the head -20 command, which filters and displays only the first 20 lines of the result.
ls /etc | head -20
#This command lists the contents of the /dev directory (where the hardware device files reside) and displays only the first 20 results in the list.
ls /dev | head -20
#This command lists the contents of the /etc directory and uses a pipe to display only the last 20 lines of the output, allowing you to see the end of the file list.
 $ ls /etc | tail -20
 #This command lists the files in the /dev directory and displays only the last 20 entries in the list, which generally correspond to the device names that are at the end of the alphabetical order.
 ls /dev | tail -20


# Additional flags
# ABSOLUTE AND RELATIVE PATHS
#   - An absolute path is the complete address from the system root (/) to a file or folder. It doesn't depend on your current location.
#   Example: /workspaces/project/file.txt

#   - A relative path is the address based on the directory you are currently in. It depends on your current location.
#   Example: ./file.txt or ../file.txt

# ENVIRONMENT VARIABLES
#   Environment variables are values ​​that the system stores with a name and that programs can use to determine how to function. They are used to define configurations without having to change the code. For example, they can indicate paths, users, or system settings.
#   Examples:
#     • PATH: tells the system where to look for programs.
#     • HOME: indicates the user's home directory.

# RESULT of ls -lai (links)
# When we run ls -lai, we see inode information and links for each directory. This represents the current directory and has two links because it always points to itself and is also referenced from its parent directory. Normally, the number of links in a directory reflects how many times that inode is referenced (including subdirectories). However, when using an overlay file system (like Docker or Codespaces), which combines several layers, this type of system doesn't maintain the actual hard link count as a traditional system would. Therefore, even though there should be more links, the system displays a simplified or different value, which explains the discrepancy between the expected and actual results.