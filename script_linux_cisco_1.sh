#BASIC COMMAND SYNTAX
#Lists the files and directories within the current location to view the folder's contents.
ls

#This command doesn't exist (the system doesn't recognize it), since Linux commands are case-sensitive.
LS

#COMMAND STRUCTURE IN LINUX
#The syntax of a command consists of the command (the action to be executed), followed by options (usually prefixed with a hyphen - to modify its behavior) and arguments (the element or value on which the command acts).
command [options…] [arguments…]

#Variations of the ls Command: Long and Reverse Listings in Linux
#Displays the contents in long listing format, detailing permissions, owner, size, and modification date.
ls -l 
#Reverses the order of the listing to show the files in reverse alphabetical order.
ls -r
#Applies both functions separately, resulting in a long listing in reverse order.
ls -l -r
#Combine the options into a single block; the result is identical to the previous one (reversed long listing), demonstrating that the order of the combined options does not alter the product.
ls -rl
ls -lr

#Exploring aptitude: Verbose Options and System Secrets
#The aptitude command wasn't working initially because GitHub Codespaces uses minimalist container images that only include essential tools to save space, leaving out this package manager. To fix this, we first synchronized the repositories with `sudo apt update` and then manually installed the tool with `sudo apt install aptitude -y`. This process downloads the necessary binaries and registers them in the system's execution paths, allowing the terminal to recognize the command and enabling us to interact with its verbosity options.

#Runs a small Easter egg that asks if there is an animal in the program. The system responds simply by stating that "there are no Easter eggs in this program."
aptitude moo
#Adding the -v verbose option gives the program a more detailed answer about the animal.
aptitude -v moo
#Using multiple `-v` options increases the level of detail and sarcasm in the program's responses. By insisting with more `v`s, the command "loses patience" and responds more humorously until, finally, it gives up and displays ASCII art of a cow as a reward for the user's curiosity.
aptitude -v -v moo
aptitude -vv moo


#PRINT THE WORKING DIRECTORY
#This command, whose acronym stands for "print working directory," displays the absolute path of your current directory. It's an essential tool for navigating folders from the terminal.
pwd
#The Home Directory and the tilde (~) Symbol: On many Linux systems, the prompt displays the location in blue. The special character ~ (tilde) is a shortcut for the home directory. When you run `pwd`, you'll see the full path instead of the abbreviated symbol.
