#! /bin/bash

echo "**** Calculator Script ****"

if [ $# -lt 1 ]; then
    echo "Usage: calc [-p pp] operation"
    echo "-p: set precision to pp"
    echo "operation: operation to be done"
    exit -1
fi

# Check if we need to set precision
if [ "$1" == "-p" ]; then
    precision=$2
    shift 2
else   
    #default precision = 3
    precision=3
fi


bc << __EOF__
scale=$precision
$@
__EOF__