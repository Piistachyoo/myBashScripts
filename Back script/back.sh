#!/bin/bash

# Check if the user sent only 1 argument and the argument is a digit
if [[ $# -ne 1 || ! $1 =~ ^[0-9] ]]; then
    echo "Usage: back number"
    echo "number: the number of backs you want to do"
    return -1 || exit -1
fi

for (( index = 0; index < $1; index++ )); do
    cd ../
done

echo "Moved to directory: $(pwd)"
