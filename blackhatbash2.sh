#!/bin/bash 
# All this script does is create a directory, create a file
# within the directory, and then list the contents of the di rectory. 
mkdir mydirectory 
touch mydirectory/myfile 
set -x
ls -l mydirectory
set +x
#bash -r blackhatbash2.sh