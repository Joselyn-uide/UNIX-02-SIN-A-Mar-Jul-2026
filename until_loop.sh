#!/bin/bash
# Define the variable with the target filename
FILE="output1.txt"
# Create an empty file
touch "${FILE}"
# Loop until the file exists and has a size greater than zero
until [[ -s "${FILE}" ]]; do
    # Print a message stating the file is currently empty
    echo "${FILE} is empty..."
    # Print a message indicating the wait time before retrying
    echo "Checking again in 2 seconds..."
    # Pause the script execution for 2 seconds
    sleep 2
# End of the until loop block
done
# Print a final message once the file is no longer empty
echo "${FILE} appears to have some content in it!"