#!/bin/bash
# Assign the first argument passed to the script to the IP_ADDRESS variable
IP_ADDRESS="${1}"
# Start the case statement to match the IP_ADDRESS against different patterns
case ${IP_ADDRESS} in
    # Pattern to match any string that begins with "192.168."
    192.168.*)
        # Print a message indicating a match for the 192.168 Class C network
        echo "Network is 192.168.x.x"
    # End of the first pattern block
    ;;
    # Pattern to match any string that begins with "10.0."
    10.0.*)
        # Print a message indicating a match for the 10.0 Class A network
        echo "Network is 10.0.x.x"
    # End of the second pattern block
    ;;
    # Default pattern (wildcard) that matches anything else if previous checks failed
    *)
    # Print a message stating the network format is unknown
    echo "Could not identify the network"
    # End of the default pattern block
    ;;
# End of the case statement block
esac

# These lines are just commented test examples for running the script
# 192.168.hola.chao
# 192.168.1.1
# 10.0.0.2
# 8.8.4.4