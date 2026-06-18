#!/bin/bash
grep "35.237.4.214" log.txt
grep "35.237.4.214\|13.66.139.0" log.txt # \ : It is an escape character
grep -e "35.237.4.214" -e "13.66.139.0" log.txt