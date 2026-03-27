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

