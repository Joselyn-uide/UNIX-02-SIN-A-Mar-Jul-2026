#!/bin/bash

# Save the first argument given by the user into a variable named USER_INPUT.
USER_INPUT="${1}"

# Check if the USER_INPUT variable is completely empty.
if [[ -z "${USER_INPUT}" ]]; then
    # Inform the user that they forgot to type a parameter.
    echo "You must provide an argument!"
    # Stop the execution immediately with an error status code.
    exit 1
fi
# Verify if the path provided by the user belongs to an existing regular file.
if [[ -f "${USER_INPUT}" ]]; then
    # Print a message confirming that the input is indeed a file.
    echo "${USER_INPUT} is a file." 
# If it is not a file, check if the input points to an existing directory instead.
elif [[ -d "${USER_INPUT}" ]]; then
    # Print a message confirming that the input is a folder.
    echo "${USER_INPUT} is a directory."
# Execute this block if the input is neither a regular file nor a directory.
else 
    # Notify the user that the argument does not match any file or folder type.
    echo "${USER_INPUT} is not a file or a directory."
fi