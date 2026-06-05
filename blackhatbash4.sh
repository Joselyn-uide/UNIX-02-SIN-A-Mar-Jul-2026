#! /bin/bash
let result="4 * 5"
echo ${result}
#20

result=$((5 * 5))
echo ${result}
#25

result=$(expr 5 + 505)
echo ${result}
#510