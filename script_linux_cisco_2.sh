# --- SECTION 12 ---
# The mv Command (Moving and Renaming Files)
# The mv command is primarily used to change the location of files or directories within the file system, or to rename them.

#To move a file to a directory while keeping its original name:
mv SOURCE DESTINATION
# To move the file people.csv into the directory named Work:
mv people.csv Work
# To check the contents of the Work directory to confirm the file was moved:
ls Work

# To move multiple files at once to the same destination directory:
mv file1 file2 file3 Destination_Directory
# To move the files numbers.txt, letters.txt, and alpha.txt together to the School directory:
mv numbers.txt letters.txt alpha.txt School
# To check the contents of the School directory to see the moved files and existing folders:
ls School

# To rename a file within the same directory:
mv current_name.txt new_name.txt
# To rename the file animals.txt to a new name called zoo.txt:
mv animals.txt zoo.txt
# Viewing the contents of the current directory to list all available files and folders
ls

# Notes
# - The mv command It requires at least two arguments: the first is the source (what will be moved or renamed), and the second is the destination.
# - To move files successfully, you must have write and execute permissions in both the source and destination folders.


# --- SECTION 13 ---
# The rm Command (Removing Files and Directories)
# The rm command is used to delete files and directories. It is important to note that deleted items do not go to a "trash bin"; they are generally removed permanently.

# To remove a file or directory using optional flags:
rm [OPTIONS] FILE

# To remove an ordinary file:
rm filename
# To remove the ordinary file named linux.txt:
rm linux.txt
# To attempt to list the file linux.txt to verify its removal:
ls linux.txt

# To remove a directory recursively (including all its contents):
rm -r directory_name
# To attempt to remove the directory Work without options (which results in an error):
rm Work
# To remove the directory Work and all of its contents recursively:
rm -r Work
# To attempt to list the Work directory to verify its removal:
ls Work

# Notes
# - To delete a file inside a directory, the user must have write and execute permissions for that specific directory.


# --- SECTION 14 ---
# Input Filtering (Filtrado de entradas)
# The grep command is a text filter that searches for lines in an input and returns those that match a specific pattern.
# To search for a pattern within a file using optional flags:
grep [OPTIONS] PATTERN [FILE]

# To copy the system password file to the current directory:
cp /etc/passwd .

# To filter and display lines matching a specific pattern within a file:
grep pattern filename
# To search for the pattern sysadmin inside the passwd file:
grep sysadmin passwd
# To verify that grep works within Codespaces, the following command was executed.
# It searches for the current username using the environment variable:
grep $USER passwd

# Notes
# - The passwd file contains details about special system accounts and user accounts.
# - The grep command can accept a simple search term as a pattern, but it is also capable of interpreting much more complex search patterns.



# --- SECTION 14.1 ---
# Regular Expressions
# Regular expressions have two common forms: basic and extended. Most commands can interpret basic regular expressions by default, whereas extended regular expressions usually require a specific command option to function properly.

# To use basic regular expressions with grep (default behavior):
grep 'PATTERN' filename

# To use extended regular expressions (using the -E option with grep):
grep -E 'EXTENDED_PATTERN' filename

# To use extended regular expressions (using the egrep command directly):
egrep 'EXTENDED_PATTERN' filename

# --- Basic Regular Expression Characters ---
# Matches any single character:
.
# Matches any specified character inside the brackets:
[ ]
# Matches any character that is NOT specified inside the brackets:
[^ ]
# Matches zero or more of the preceding character:
*
# Matches the pattern only if it is at the beginning of the line:
^
# Matches the pattern only if it is at the end of the line:
$

# --- Extended Regular Expression Characters ---
# Matches one or more of the preceding pattern:
+
# Indicates that the preceding pattern is optional:
?
# Specifies the minimum, maximum, or exact number of matches for the preceding pattern:
{ }
# Alternation - Represents a logical OR operation:
|
# Used to group patterns together:
( )

# Notes
# - Extended regular expressions require the use of the egrep command or passing the -E option to the standard grep command.
# - If ^ or $ are not placed at the absolute beginning or end of the pattern respectively, they are treated as literal characters.



# --- SECTION 14.2 ---
# Basic Patterns 
# This section demonstrates how to use basic regular expressions with the grep command to filter specific text patterns using anchor characters, wildcards, bracket expressions, and repetition quantifiers.

# To display the content of the file alpha-first.txt:
cat alpha-first.txt
# To display the content of the file red.txt:
cat red.txt
# To display the content of the file profile.txt:
cat profile.txt

# To search for a pattern that matches only at the beginning of a line using the ^ anchor:
grep '^PATTERN' filename
# To search for lines that start with the word root inside the passwd file:
grep '^root' passwd
grep '^root' /etc/passwd

# To search for a pattern that matches only at the end of a line using the $ anchor:
grep 'PATTERN$' filename
# To search for lines that end with the letter r inside the alpha-first.txt file:
grep 'r$' alpha-first.txt

# To search using the . wildcard which matches any single character except a newline:
grep 'r..f' filename
# To search for lines containing the letter r, followed by any two characters, and then the letter f in red.txt:
grep 'r..f' red.txt

# To search for lines containing the letter r, followed by any two characters, and then the letter d in red.txt:
grep 'r..d' red.txt

# To search for lines that contain at least four characters in red.txt:
grep '....' red.txt

# To search for lines containing the letter r, followed by any two characters, and then the letter t in the passwd file:
grep 'r..t' passwd

# To search for a single character from a specified set or range using brackets [ ]:
grep '[RANGE]' filename
# To search for lines in profile.txt that contain any single digit from 0 to 9:
grep '[0-9]' profile.txt

# To invert a match inside brackets using the ^ character as the first element (matches anything NOT in the set):
grep '[^RANGE]' filename
# To search for lines in profile.txt that contain at least one character that is NOT a number:
grep '[^0-9]' profile.txt

# To match a literal dot character inside a bracket expression instead of using it as a wildcard:
grep '[.]' filename
# To search for lines in profile.txt that contain a literal period character:
grep '[.]' profile.txt

# To match zero or more repetitions of the preceding character using the * quantifier:
grep 'PATTERN*' filename
# To search for lines containing r, followed optionally by one or more e's, and ending with d in red.txt:
grep 're*d' red.txt
# To search for lines containing r, followed optionally by one or more o's or e's, and ending with d in red.txt:
grep 'r[oe]*d' red.txt
# To search for lines matching any character combination because z is optional (matches every line) in red.txt:
grep 'z*' red.txt
# To search for lines matching any character combination because e is optional (matches lines containing r) in red.txt:
grep 'e*' red.txt
# To search for lines containing at least one literal e, followed by zero or more e's in red.txt:
grep 'ee*' red.txt

# Notes
# - If grep is executed without specifying a filename, it acts on standard input, allowing interactive text filtering until Ctrl+D is pressed.
# Because Linux is case-sensitive, some commands use the -i (case-insensitive) option. For example: Adding the -i flag makes grep case-insensitive. It will find both "Reef" and "Roof".
grep -i 'r..f' red.txt




# --- SECTION 15 ---
# The shutdown Command (Shutting Down the System)
# The shutdown command prepares the system to safely power off or reboot. It notifies all logged-in users and prevents new logins during the final five minutes prior to the complete shutdown.

# To prepare the system for a safe power off using optional flags, a time constraint, and a custom warning message:
shutdown [OPTIONS] TIME [MESSAGE]

# To switch the current user session to the root administrative account:
su -

# To initiate an immediate system shutdown without any delay:
shutdown now

# To display the current system date, time, and time zone information:
date

# To schedule a system shutdown at a specific time of day in hh:mm format:
shutdown 01:51

# To schedule a system shutdown with a relative delay in minutes and broadcast a custom notification message to all users:
shutdown +1 "Goodbye World!"

# Notes

# - Running the shutdown command requires root or administrative privileges on the system.



# --- SECTION 16 ---
# Network Configuration
# This section covers commands used to display or modify network interface configurations and to test connectivity between host devices over a network.

# To display network interface configuration information using optional flags:
ifconfig [OPTIONS]
# To display the configuration details of all active network interfaces on the system:
ifconfig

# To verify connectivity to a remote host or network device using its IP address or domain name:
ping [OPTIONS] destination
# To send exactly four ICMP echo request packets to the local network interface IP address to test connectivity:
ping -c 4 192.168.1.2
# To send exactly four ICMP echo request packets to an unreachable or non-existent network IP address:
ping -c 4 192.168.1.3

# --- Codespaces Environment Troubleshooting & Practice ---
# To synchronize the local package index with the remote repositories to fetch recent package updates:
sudo apt-get update
# To resolve a missing command error by installing the network utility package containing the ping tool:
sudo apt-get install -y iputils-ping
# To test internal host loopback connectivity after package installation using the standard local host address:
ping -c 4 127.0.0.1

# Notes
# - The eth0 interface represents the primary wired Ethernet network device, which shows status indicators like UP, RUNNING, and its assigned IPv4 address.
# - The lo interface represents the local loopback device, a virtual network interface used by the local machine to route network traffic to itself.
# - The iwconfig command functions similarly to ifconfig but is dedicated exclusively to wireless network interfaces.

# Codespaces Real-World Observations
# - Running 'ifconfig' in GitHub Codespaces exposes custom interfaces like docker0 (used for container isolation) and assigns eth0 a dynamically generated private IP (e.g., 10.0.1.28) instead of the static lab defaults.
# - The 'ping' package is excluded by default in lightweight container deployments, triggering a "bash: ping: command not found" error until explicitly resolved via the apt package manager.
# - Performing a ping execution to the lab network targets (192.168.1.2 or 192.168.1.3) from within Codespaces yields 100% packet loss because those IP networks are isolated inside the virtual Cisco training environments and do not exist on the external cloud instance.



# --- SECTION 17 ---
# Process Viewing 

# When a command is executed, it results in a process. In Linux, processes run based on the privileges of the executing user. While regular users can only control their own processes, the root administrative account has full authority over all processes running on the system.

# To snapshot the currently active processes using optional flags:
ps [OPTIONS]

# To view only the processes running within the current active terminal session:
ps

# To list every single process running across the entire operating system:
ps -e

# To generate a full-format, detailed listing of all active processes on the system:
ps -f

# To combine options and view all processes with comprehensive metadata details:
ps -ef

# --- Key Output Columns Generated by ps ---
# - UID:   The user ID or identity of the account that owns and started the process.
# - PID:   The Process Identifier, a unique numeric ID assigned by the system to track each process.
# - PPID:  The Parent Process Identifier, which reveals the ID of the process that created this one.
# - TTY:   The terminal device name controlling the process (a '?' indicates it is a system background service).
# - TIME:  The cumulative CPU processing time utilized by the specific process.
# - CMD:   The full command name, executable path, and arguments used to initiate the process.