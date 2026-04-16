#Anatomy of a UNIX command  ---  command [options] [arguments]
#The ls -lah command is used to list all the contents of a directory, including hidden files (-a), displaying technical details such as permissions and dates in long list format (-l), and transforming file sizes into readable units such as KB or MB (-h) for easier reading.
ls -l -a -h
ls -lah

#Create a directory whose name is literally -rf (the use of -- tells Linux that what follows is not an option or parameter, but the name of the folder).
mkdir -- -rf
#Delete an empty directory that is named exactly -rf.
rmdir -- -rf

#It shows a quick and summarized guide to all the options and parameters you can use with the ls command (like the ones we saw for -lah).
ls --help
#Open the official and detailed manual for the ls command, explaining in detail each function, permissions, and output formats.
man ls
#Displays the main Git manual, which serves as an index to understand how repositories work and how to access help for specific subcommands (such as man git-commit).
man git
#To navigate efficiently in the manual (man), use the / key followed by the term you wish to locate; once the search has started, press n to jump to the next match forward or N to return to the previous one in the opposite direction.
man git-clone #We are looking for what --depth does:Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.