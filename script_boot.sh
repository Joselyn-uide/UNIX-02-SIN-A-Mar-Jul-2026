#Create a new folder (directory) called "project"
mkdir proyecto
# The command cd project/ allows you to enter the "project" folder, and a relative path is one that defines a location based on your current directory rather than starting from the system root.
cd proyecto/
#The command moves you directly to that specific folder, and an absolute path is the complete and exact address of a file or folder from the system root (the origin /), regardless of which directory you are working in.
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto

#CHANGE DIRECTORY (/home)
# The cd command instantly returns you to your home directory (/home/username)
cd
#The command cd ~ takes us directly to the home directory.
cd ~ 
#The command `cd /home/codespace` takes us directly to the user's specific folder "codespace" using its absolute path, ensuring we reach that exact destination no matter where we are navigating in the system.
cd /home/codespace
#Environment variables
#The command cd $HOME uses an environment variable called $HOME to automatically take you to your user folder.
cd $HOME
#The echo $HOME command prints the full path of the home directory to the screen, allowing you to view the value stored in that specific system environment variable.
echo $HOME
#The command `echo $BASH` displays the absolute path to the Bash executable on the screen.
echo $BASH
#The echo $PATH command displays a colon-separated list of directories where the system looks for executable programs when you type a command without specifying its full path.
echo $PATH
#The command cd /usr/local places you in a standard UNIX hierarchy directory intended for programs and data installed locally by the administrator, outside of the main operating system files.
cd /usr/local