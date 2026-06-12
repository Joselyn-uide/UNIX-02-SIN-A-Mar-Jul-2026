#!/bin/bash
# Loop through all files matching the pattern "example_file*"
for file in example_file*; do
    # Check if the current file name is exactly "example_file1"
    if [[ "${file}" == "example_file1" ]]; then
        # Print a message indicating this specific file is being skipped
        echo "Skipping the first file"
        # Skip the rest of the current iteration and move to the next file
        continue
    # End of the if condition block
    fi
# Overwrite the current file with a random system-generated number
echo "${RANDOM}" > "${file}"
# End of the for loop block
done