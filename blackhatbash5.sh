#! /bin/bash
top  # Displays real-time system processes, CPU usage, and memory usage.
top&  # # Runs the 'top' process monitor in the background, freeing up the terminal.

#Immediately force the closure of the process with the PID
kill -9 (PID)
kill -9 8414

touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "The lzl command has failed"

echo "Hello World!" > output.txt
cat output.txt
echo "Bye World!" > output.txt
cat output.txt
echo "Bye Bye" >> output.txt
cat output.txt

ls -l / &> stdout_and_stderr.txt
ls -l / &>> stdout_and_stderr.txt
cat stdout_and_stderr.txt
ls -l / 1> stdout.txt 2> stderr.txt
cat stdout.txt
cat stderr.txt
lzl 2> error.txt
cat error.txt