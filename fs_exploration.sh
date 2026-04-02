#Change the current directory to the system root directory
cd / 
#List the contents of the current directory by adding a symbol to the end of each name to identify what type of file it is.
ls -F

#Update the list of available packages and their versions from the repositories
sudo apt update
#Download and install the latest versions of all the packages you already have installed on your system
sudo apt upgrade
#Download and install the Parted tool specifically
sudo apt install parted

#It displays detailed information about the disks and their partitions.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n" 
#List all partitions on all disks with technical details.
sudo parted -l
#List the disks and partitions, detailing their format type (ext4, ntfs, fat32), unique identifiers, and where they are mounted.
lsbk -f
#&&: It is a logical connective that says: "if the previous command was successful, execute the next one."
#Filters the list of all mounted file systems
mount | grep 
# echo -e, the -e parameter enables the interpretation of special characters with backslashes, allowing the use of commands like \n for line breaks
-e 