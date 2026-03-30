#change directory to /dev directory
cd /dev
#list files and directories on the /dev directory
ls
#change directory to /proc directory
cd /proc
#displays information from the cpuinfo file
cat cpuinfo
# Change my current working directory to the project's specific folder.
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/
#This command uses the GCC compiler to transform the source code written in the file saludo.c into an executable program called saludobin
gcc saludo.c -o saludobin
# Move the saludobin executable file to the system folder /bin/
sudo mv saludobin /bin/
#The saludobin program is executed.
saludobin
#change directory to /etc
cd /etc
#Enter a subfolder called gss located inside /etc)
cd gss/
#Displays the full path of the current directory where you are working in the terminal
pwd
#Lists the files and folders in the current directory by adding a symbol to the end of each name
ls -F
#It displays the inode number (internal system index) next to each file or folder to identify its physical location on the disk.
ls -i


#Additional notes mentioned in class:
# - In Linux, tty files are terminal interfaces that allow communication with the system. Those that include an 'S' (like ttyS0) represent the hardware's serial ports. These act as the physical bridge for sending and receiving bit-by-bit data to and from external peripherals like the Arduino.

# - In Windows, partitions are named with drive letters (like C: or D:), while in Linux they are managed as device files within /dev/ (like sda, sdb, etc.).

# - In C, `#include <stdio.h>` copies a header file with input/output functions into the code before compiling (Standard Input/Output (stdio)). In Python, `import` dynamically loads a module file during execution to enable its tools.

# - C is a strongly typed and statically typed language, meaning that the type of each variable must be declared in the code and cannot change during execution.

# - Indentation is the whitespace at the beginning of a line of code used to hierarchically organize instructions.

# - In Linux, success means that a process or command executed and finished correctly, returning an exit code of 0 to the operating system.

# - A pointer is a variable that stores the memory address of another variable or file in the system.

# - In Windows, the kernel is located in the file ntoskrnl.exe in C:\Windows\System32, while in Linux it is an executable file (vmlinuz) located in the /boot directory.