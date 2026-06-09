#!/bin/bash
# This script will ping any address provided as an argument.
SCRIPT_NAME="${0}"
TARGET="${1}"
echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target: ${TARGET}..."
ping -c 5 "${TARGET}" 

echo "The arguments are: $@"
echo "The total number of arguments are: $#"

# Change "$@" to "$*" to observe behavior. 
for args in "$@"; do 
    echo "${args}" 
done

# Takes input from the user and assigns it to variables 
echo "What is your first name?" 
read -r firstname 

echo "What is your last name?" 
read -r lastname 

echo "Your first name is ${firstname} and your last name is ${lastname}"