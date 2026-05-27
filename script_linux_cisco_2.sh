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