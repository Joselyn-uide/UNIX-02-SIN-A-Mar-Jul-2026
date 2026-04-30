#BASIC COMMAND SYNTAX
#Lists the files and directories within the current location to view the folder's contents.
ls

#This command doesn't exist (the system doesn't recognize it), since Linux commands are case-sensitive.
LS

#COMMAND STRUCTURE IN LINUX
#The syntax of a command consists of the command (the action to be executed), followed by options (usually prefixed with a hyphen - to modify its behavior) and arguments (the element or value on which the command acts).
command [options…] [arguments…]

#Variations of the ls Command: Long and Reverse Listings in Linux
#Displays the contents in long listing format, detailing permissions, owner, size, and modification date.
ls -l 
#Reverses the order of the listing to show the files in reverse alphabetical order.
ls -r
#Applies both functions separately, resulting in a long listing in reverse order.
ls -l -r
#Combine the options into a single block; the result is identical to the previous one (reversed long listing), demonstrating that the order of the combined options does not alter the product.
ls -rl
ls -lr

#Exploring aptitude: Verbose Options and System Secrets
#The aptitude command wasn't working initially because GitHub Codespaces uses minimalist container images that only include essential tools to save space, leaving out this package manager. To fix this, we first synchronized the repositories with `sudo apt update` and then manually installed the tool with `sudo apt install aptitude -y`. This process downloads the necessary binaries and registers them in the system's execution paths, allowing the terminal to recognize the command and enabling us to interact with its verbosity options.

#Runs a small Easter egg that asks if there is an animal in the program. The system responds simply by stating that "there are no Easter eggs in this program."
aptitude moo
#Adding the -v verbose option gives the program a more detailed answer about the animal.
aptitude -v moo
#Using multiple `-v` options increases the level of detail and sarcasm in the program's responses. By insisting with more `v`s, the command "loses patience" and responds more humorously until, finally, it gives up and displays ASCII art of a cow as a reward for the user's curiosity.
aptitude -v -v moo
aptitude -vv moo


#PRINT THE WORKING DIRECTORY
#This command, whose acronym stands for "print working directory," displays the absolute path of your current directory. It's an essential tool for navigating folders from the terminal.
pwd
#The Home Directory and the tilde (~) Symbol: On many Linux systems, the prompt displays the location in blue. The special character ~ (tilde) is a shortcut for the home directory. When you run `pwd`, you'll see the full path instead of the abbreviated symbol.

#FILE SYSTEM NAVIGATION AND HIERARCHY
#Linux organizes information in a hierarchical, tree-like structure, where directories (folders) contain files or other subdirectories. The base of everything is the root directory, represented by /. 
#Navigation is done using paths: absolute paths start from the root (/), defining an exact location, while relative paths start from the directory you are currently in.
#Navigating to a deeper location can be done in two ways:
# - Combined Path: Using a single command to jump several levels, separating directories with a slash.
# - Step-by-Step: Executing individual commands to advance one level at a time.

#Change the current directory to the specified location.
cd [path]
#Move you directly to the top level of the system (root directory).
cd /
#Move you back one level in the hierarchy, to the "parent directory".
cd ..
#This is a quick way to return to your home directory from anywhere.
cd ~
#Represents the current directory (useful for running location-specific scripts or commands).
cd .


#FILE LISTING AND DETAILS
#File listings (ls): When applied to system paths like /var/log (where system logs are stored), we can observe a wide variety of file types and permissions.
#Anatomy of a Long Listing (ls -l)
ls -l
#Using the -l option, each line represents a file divided into specific fields:
# - File type: The first character indicates what it is: d (directory), - (ordinary file such as text or images), l (symbolic link), s/p (inter-process communication via socket or pipe), and b/c (block or character hardware files).
# - Permissions: The next nine characters define who can read, write, or execute (user, group, others).
# - Links: Number of direct links to the file.
# - Owner and Group: Indicates which user and group own the file.
# - Size: File size in bytes (or blocks in directories).
# - Timestamp: Date and time of the last modification.
# - Name: The final name of the file or directory. If it's a symbolic link, an arrow -> appears indicating where it points.

#Sorting and Display Options
#(-t for time) Sorts files by date and time (newest first).
ls -lt
#(-S for size) Sorts files by size (largest first).
ls -lS
#Reverses any sort order (alphabetical, by time, or by size). For example, ls -lSr will display files from smallest to largest.
ls -r

# Administrative Access: Privilege Management with `su` and `sudo`
# The root user is the account with superpowers (full administrative access) that allows you to perform any action. To operate with these privileges from a normal account, two main tools are used.
#   - The `su` Command (Switch User)
#       This command allows you to temporarily act as a different user by creating a new "shell" or login console.
#       It switches the session to that of the specified user.
#       su [options] [username]

#       Starts a full administrative session, configuring the new user's environment (recommended for accessing as root).
        su -
        su -l
        su --login
#       Password: After execution, you will be prompted for the password, which will not be visible while you type it for security reasons.
#       This command is used to log out of the current root user session and return to the previous account.
        exit
#       Note: You will know you are root because the command prompt usually changes from $ to #.

#   - The `sudo` command (Substitute User Do) allows you to execute commands with the privileges of another user (root by default) without needing to create a new permanent shell.
#       Preceding any command with `sudo` will execute it with administrative privileges.
        sudo [command]
#       Option to execute the command as a specific user other than root.
        sudo -u [user] [command]


#SYSTEM SECURITY: PERMISSIONS AND ACCESS CONTROL
# Permissions
# Permissions in Linux define how users interact with files. Running `ls -l` displays them in a nine-character block divided into three groups: owner, group, and others.

# Modifying Permissions with `chmod`
# The `chmod` (change mode) command is used to change the permissions of files and directories. Only the file owner or the root user can make these changes.
#   Symbolic Method: The syntax is: chmod [PERMISSION_SET][ACTION][PERMISSIONS] FILE
#       - Permission set: u (user/owner), g (group), o (others), and a (everyone/all).
#       - Action: + (add permission), - (remove permission), and = (assign exact permission).
#       - Permissions: r (read), w (write), and x (execute).

#Before running the commands in Codespaces, we created a directory called Documents and, within it, created a file called hello.sh. Then, we set the script's permissions to 644 (-rw-r--r--) using the chmod command. The commands used were: mkdir Documents, touch Documents/hello.sh, and chmod 644 Documents/hello.sh.

# The `ls` command is used to list the file and examine its current permissions. Initially, the file has `-rw-r--r--`, indicating that it has no execute permissions.
ls -l hello.sh
# This command adds (+) execute permission (x) only to the owner (u) of the file named hello.sh.
chmod u+x hello.sh
# This command is used to run the script from the current directory. The `./` prefix is ​​necessary to indicate that the system should look for the command in the current location. If you do not have the `x` permission, this command returns the error "Permission denied".
./hello.sh


# CHANGING THE OWNER OF A FILE
# The `chown` (change owner) command is used to change the user who owns files and directories.
# Usage Restriction: Requires administrative access.
# Basic Syntax: chown [OPTIONS] [OWNER] FILE

# This allows you to verify who the current owner is; the third column indicates the owning user.
ls -l

# sudo is used to obtain the necessary administrative privileges. The first argument (root) is the new owner. hello.sh is the affected file.
sudo chown root hello.sh

# When you run it after the previous command, you will see that root now appears in the third column.
ls -l hello.sh

# To run the script now that it belongs to a different user, you must precede it with `sudo` to run it with superuser privileges.
sudo ./hello.sh


# VIEWING CONTENT IN LINUX
# File viewing depends primarily on the document size and which part you need to review.
#   - cat (Concatenate): This tool is for viewing small files. It displays all the text at once in the terminal. It is not recommended for large files because it does not allow scrolling or pausing.
#   - more and less (Pagination): These commands are ideal for long files. They allow you to read the content by sections or pages, offering more controlled navigation.
#   - head: This is used to quickly view the beginning of a file. By default, it displays the first 10 lines.
#   - tail: This is used to view the end of a file. It is especially useful for monitoring log files that constantly add new information to the end. By default, it displays the last 10 lines.
#   - The `-n` option is a modifier for `head` and `tail` that allows you to specify the exact number of lines you want to display, overriding the default value of 10.

# Before running the commands in Codespaces, create the files `animals.txt` and `alpha.txt` in the `Documents` directory using the command `touch animals.txt alpha.txt`. Then, use the nano editor to structure the content of each file: `animals.txt` contains a numbered list of animals, and `alpha.txt` contains a complete descriptive alphabet.
# Displays the complete list of animals contained in the file.
cat animals.txt
# Displays the first 10 lines of the alphabet (A to J).
head alpha.txt
# Displays the last 10 lines of the alphabet (Q to Y).
tail alpha.txt
# Displays only the first 5 lines (A to E).
head -n 5 alpha.txt
# Displays only the last 5 lines (letters V-Z).
tail -n 5 alpha.txt


# COPYING FILES IN LINUX
# Copying files is a fundamental task for creating backups, transferring documents, or using existing files as templates.
# The `cp` (copy) command is used to duplicate files. It requires at least two arguments: a source (the file you want to copy) and a destination (where you want to save the copy).
# Influence of Permissions: The `cp` command is affected by security settings:
#   - You need execute permission (`x`) to access both the source and destination directories.
#   - You need read permission (`r`) on the file you are copying.
#   - You need write permission (`w`) and execute permission on the directory where you will create the copy.
# Common Locations: You typically have full permissions on your home directory (represented by `~`) and the temporary directory `/tmp`.

#Source: The `/etc/passwd` file.
#Destination: The current directory (indicated by `.`).
#Result: A copy of the system's user configuration file is created in the Documents folder.
cp /etc/passwd .