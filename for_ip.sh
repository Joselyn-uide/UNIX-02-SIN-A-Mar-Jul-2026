#!/bin/bash
# Loop through all the arguments (IP addresses) passed to the script
for ip_address in "$@"; do
    # Print a message showing which IP address is currently being processed
    echo "Taking some action on IP address ${ip_address}"
    # Send a single ping packet to the current IP address
    ping -c 1 "${ip_address}"
# End of the for loop block
done

# 127.0.0.1 
# 0.0.0.0 
# 172.17.0.1