#!/bin/bash
# This script will send the sleep command to the background
echo "Sleeping for 10 seconds..."
sleep 10 &
# Creates a file
echo "Creating the file test123"
touch test123
sleep 30
# Delete a file
echo "Deleting the file test123"
rm test123
