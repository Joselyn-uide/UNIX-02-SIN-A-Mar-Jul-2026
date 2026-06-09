#!/bin/bash

# Experimenting with exit codes

ls -l > /dev/null
echo "The exit code of the ls command was: $?"

lzl 2> /dev/null
echo "The exit code of the non-existing lzl command was: $?"