#!/bin/bash
# Define the variable with the filename to watch for
SIGNAL_TO_STOP_FILE="stoploop"
# Loop as long as the specified file does not exist
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
    # Print a message stating the file is missing
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
    # Print a message indicating the wait time
    echo "Checking again in 2 seconds..."
    # Pause the script execution for 2 seconds
    sleep 2
# End of the while loop block
done
# Imprime un mensaje final una vez que se detecte el archivo.
echo "File was found! Exiting..."