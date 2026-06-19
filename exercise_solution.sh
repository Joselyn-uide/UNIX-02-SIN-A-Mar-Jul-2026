#!/bin/bash
# Shebang line

NAME="${1}"
# Assigns the first command-line argument passed to the script to the variable 'NAME'.

DOMAIN="${2}"
# Assigns the second command-line argument passed to the script to the variable 'DOMAIN'.

OUTPUT_FILE="results.csv"
# Defines a variable with the name of the file where the output will be saved ("results.csv").

# Check if the two expected arguments are set
# Comment explaining the purpose of the upcoming conditional block.

if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
# Starts an 'if' statement checking if either 'NAME' OR 'DOMAIN' variable is empty (-z).

  echo "You must provide two arguments to this script."
  # Prints an error message to the terminal if one or both arguments are missing.

  echo "Example: ${0} mysite nostarch.com"
  # Prints a usage example. '${0}' dynamically represents the current script's filename.

  exit 1
  # Terminate the script immediately with an error status code of 1.

fi
# Closes the 'if' condition block.

# Write CSV header to the file
# Comment explaining that the next line creates or initializes the output file structure.

echo "status,name,domain,timestamp" > ${OUTPUT_FILE}
# Overwrites (or creates) the 'results.csv' file with the defined column headers.

if ping -c 1 "${DOMAIN}" &> /dev/null; then
# Sends exactly 1 ping packet (-c 1) to the domain, hiding all output (&> /dev/null), and checks if it succeeds.

  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
  # If the ping succeeds, appends a "success" row with the data and current timestamp to the CSV file.

else
# If the ping fails, executes the following block.

  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
  # Appends a "failure" row with the data and current timestamp to the CSV file.

fi
# Closes the ping conditional block and ends the script execution.

sleep 1000