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