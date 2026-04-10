#sudo apt update: Updates the list of available packages in the repositories to see the latest versions.
sudo apt update
#sudo apt upgrade: Downloads and installs the latest versions of all packages already installed on your system.
sudo apt upgrade
#It automatically installs all necessary dependencies and build tools (such as GCC, Git, and development libraries) without asking for confirmation.
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
#Download only the latest version of the Linux kernel source code, omitting the entire history to save time and space.
git clone --depth 1 https://github.com/torvalds/linux.git
#Change the current working directory to the folder containing the newly downloaded source code.
cd linux
#Opens a text-based graphical interface to configure the options and modules to be included in the kernel compilation.
make menuconfig
#This command starts compiling the source code using 2 parallel processing threads to speed up the software building process.
make -j 2

#This command creates a new folder called boot-files in the system root directory, using administrator privileges to ensure write permissions.
sudo mkdir /boot-files
#This command copies the newly compiled kernel file (bzImage) from its original location to the /boot-files/ folder using administrator privileges.
sudo cp arch/x86/boot/bzImage /boot-files/
