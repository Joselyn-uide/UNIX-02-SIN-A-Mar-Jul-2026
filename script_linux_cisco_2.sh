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