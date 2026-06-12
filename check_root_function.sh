#!/bin/bash
# This function checks if the current user ID equals zero. 
# Define a function named check_if_root to verify administrative privileges.
check_if_root(){
    # Compare the EUID variable with the number 0. 
    # EUID: "Effective User ID" is an internal Linux environment variable 
    # that stores the ID of the current running user. If this value is 0, 
    # it strictly means the script is being executed by the 'root' superuser.
    if [[ "${EUID}" -eq "0" ]]; then
        # Return a success code (0) to confirm the user has root privileges.
        return 0
    else
        # Return a failure code (1) indicating the user is a standard account.
        return 1
    fi
}
# Run the function and evaluate its return status code directly.
if check_if_root; then
    # Display this message if the function returned 0 (successful root check).
    echo "User is root!"
else
    # Display this alternative message if the function returned 1 (not root).
    echo "User is not root!"
fi

# Create the new user luna 
# adduser luna
# Switch session to the luna user, fully loading their configuration environment.
# su - luna