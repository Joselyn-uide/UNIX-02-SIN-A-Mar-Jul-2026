#!/bin/bash

# Store the first argument ($1) in the variable FIRST_NAME.
# The quotation marks prevent the script from breaking if the argument contains spaces.
FIRST_NAME="${1}"

# Store the second argument ($2) in the variable LAST_NAME.
LAST_NAME="${2}"

# if [ ... ]; then -> Conditional structure: "If (this condition is met); then..."
# -z -> Operator that checks if a variable is EMPTY.
# || -> Logical OR operator. It means "Or if this other variable is also empty".
if [ -z "${FIRST_NAME}" ] || [ -z "${LAST_NAME}" ]; then
    
    # echo -> Command used to print text on the screen.
    # ${0} -> Special variable that holds the name of this script file.
    echo "Error: You must provide your first name and last name as arguments."
    echo "Usage: bash ${0} <firstname> <lastname>"
    
    # exit 1 -> Stops the script immediately, reporting an error (exit code 1).
    exit 1
    
# fi -> Closes the 'if' conditional structure ('if' spelled backward).
fi


# Saves the output file name so we do not have to retype it every time.
OUTPUT_FILE="output.txt"

# date -> System command that retrieves the current system date and time.
# +"%d-%m-%Y" -> Custom format: %d (Day), %m (Month), %Y (4-digit Year).
# > -> Redirection operator. Overwrites the file content and inserts this new text.
date +"%d-%m-%Y" > "${OUTPUT_FILE}"

# >> -> Append operator. Adds text to the bottom of the file without erasing the top.
echo "Full Name: ${FIRST_NAME} ${LAST_NAME}" >> "${OUTPUT_FILE}"

# cp -> "copy" command. Requires an origin file and a destination file name.
# Structure: cp <original_file> <backup_name>
cp "${OUTPUT_FILE}" "backup.txt"

# cat -> "concatenate" command. In this context, it reads and displays the file content.
cat "${OUTPUT_FILE}"
