#! /bin/bash

BASE_IP="192.168.1."
SUCCESS_STRING=" 0% packet"

for i in {1..10}; do
    result=`ping "${BASE_IP}${i}" -c 1`
    if [[ "${result}" == *${SUCCESS_STRING}* ]]; then
        echo "${BASE_IP}${i} exists"
    else
        echo "${BASE_IP}${i} does not exist"
    fi
done