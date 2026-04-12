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


#Download the latest version of BusyBox source code without downloading the full history to save time and space.
git  clone --depth 1 https://git.busybox.net/busybox
#Change the current directory to the newly created folder containing the BusyBox files.
cd busybox
#Open the settings menu where you enable Build static binary in Settings → Build Options so that the binary is independent and does not require external libraries.
make menuconfig
#BusyBox starts compiling using two processor cores in parallel to speed up the creation of the executable.
make -j 2

#Search for the string CONFIG_TC=y within the .config file and replace it with CONFIG_TC=n automatically and permanently without opening the editor.
sed -i 's/CONFIG_TC=y/CONFIG_TC=n/' .config
#Find and display on screen the specific line that contains the text CONFIG_TC= so you can verify if the change was applied correctly.

#Create a specific subfolder called initramfs within the boot directory to organize the temporary file system files.
sudo mkdir /boot-files/initramfs
#Instala todos los binarios y herramientas de BusyBox (como ls, sh, cp) dentro de la carpeta de destino especificada, configurándola como la base de tu futuro sistema operativo.
sudo make CONFIG_PREFIX=/boot-files/initramfs install


#Change the current working directory to the absolute path `/boot-files/initramfs`, where the installed file structure for the root system resides.
cd /boot-files/initramfs

#Run the vi text editor with superuser privileges to create the init file, which acts as the process with PID 1 (the first process in the system).
sudo vi init
#When creating the init file with vi, the first command (#!/bin/sh) tells the kernel which interpreter to use, while /bin/sh launches the interactive terminal necessary to prevent a kernel panic and allow you to control the system. To save in vi, press i, type the commands, press Esc, and finish with :wq! followed by Enter.

#Use the `remove` command with elevated privileges to delete the `linuxrc` file, avoiding conflicts with the new boot standard based on the init script.
sudo rm linuxrc

#Modify the file's mode (chmod) to add the execute bit (+x), allowing the kernel to treat the init file as an executable binary.
sudo chmod +x init

#This command searches for files (find .), passes them to `cpio` to create a file (-o) with SVR4 header format (-H newc), and redirects the output (>) to the top level as `init.cpio`.
sudo find . | cpio -o -H newc > ../init.cpio

#This command uses the double dot argument (..) to move back one level in the directory hierarchy, returning to the general boot files folder.
cd ..


#Elevates the privileges of the current session to superuser (root) to perform unrestricted low-level operations on the file system.
sudo su

#Uses the `dd` command to create a 50 MB file named `boot`, filling it with binary zeros (/dev/zero) as raw storage space.
dd if=/dev/zero of=boot bs=1M count=50

#Formats the `boot` file with the FAT file system (-t fat), a requirement for the boot loader to be readable.
mkfs -t fat boot

#Installs the Syslinux boot loader binary directly into the `boot` file, modifying its starting sector to make it bootable.
syslinux boot

#Creates a temporary directory named `m` that will serve as a mount point to access the contents of the virtual disk.
mkdir m

#Associates the boot file with the `m` folder, allowing the operating system to treat that file as if it were a connected physical disk drive.
mount boot m

#Copies the system kernel (`bzImage`) and the compressed file system (`init.cpio`) into the virtual disk mounted at `m`.
cp bzImage init.cpio m

#Disconnects the virtual disk from the mount point `m`, ensuring that all data is correctly written to the boot file before closing it.
umount m


qemu-system-x86_64 -nographic -append "console=ttyS0" -kernel bzImage -initrd init.cpio -drive file=boot,format=raw
#Runs the emulator for the 64-bit architecture, simulating a complete computer within the terminal.
qemu-system-x86_64

#Disables QEMU's video output and redirects all content to the current terminal, allowing interaction without a graphical interface.
-nographic

#Sends an instruction to the Linux kernel to use the serial port (ttyS0) as the main display, allowing boot messages to be viewed.
-append "console=ttyS0"

#Tells QEMU the path to the newly compiled Linux kernel so it can be loaded directly into virtual memory.
-kernel bzImage

#Loads the initial RAM filesystem that was created, which contains BusyBox and the startup script.
-initrd init.cpio

#Connects the boot file as if it were a physical hard drive in raw format so the emulated system can recognize it.
-drive file=boot,format=raw


#When the command starts running, the current terminal will transform into the new Linux screen.
#Lists the files in the root directory. The output shows folders like bin and usr, confirming that the file structure loaded correctly from init.cpio.
ls /

#Displays system information. The output confirms that the compiled Kernel 7.0.0 is running, along with the exact creation date.
uname -a

#Identifies the current user. The result unknown uid 0 indicates that I am the administrator (root).
whoami 

#Opens the terminal calculator, where the system can perform complex mathematical calculations by processing binary logic.
bc

#Print Working Directory: This command confirms that we are in the root directory (/).
pwd

#This is the text editor. By running it, we can create or modify configuration files directly in the system's RAM.
vi

#Exit Procedure
#To safely close the emulator from -nographic mode, the following QEMU escape sequence was used:
# - Ctrl + A: This combination puts QEMU into listening mode for special commands.
# - X key: Sends the immediate termination signal.