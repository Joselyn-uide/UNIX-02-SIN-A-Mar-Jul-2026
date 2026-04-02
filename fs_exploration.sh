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