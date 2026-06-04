#! /bin/bash
bash --version
env
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}


ps -ef
df --human-readable
bash -r blackhatbash1.sh
bash -n blackhatbash1.sh
bash -x blackhatbash1.sh #It activates step-by-step debugging mode (shows each line of code before executing it), and the infinite loop occurs because the loop's stopping condition (while or until) within the script is never met or is always true.
man 
set -x #Activate tracing mode to print each command and its arguments to the screen before they are executed.
set +x #Disable tracking mode to return to normal, clean script execution.