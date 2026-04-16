#Anatomy of a UNIX command  ---  command [options] [arguments]
#The ls -lah command is used to list all the contents of a directory, including hidden files (-a), displaying technical details such as permissions and dates in long list format (-l), and transforming file sizes into readable units such as KB or MB (-h) for easier reading.
ls -l -a -h
ls -lah

#Create a directory whose name is literally -rf (the use of -- tells Linux that what follows is not an option or parameter, but the name of the folder).
mkdir -- -rf
#Delete an empty directory that is named exactly -rf.
rmdir -- -rf