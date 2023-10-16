#! /bin/bash

if [ $# -lt 2 ]; then
    echo "USAGE: $0 <file1> <file2>"
    exit -1
fi

file1=$(md5sum $1)
file2=$(md5sum $2)

OLD_IFS=${IFS}
IFS=' '
read -ra file1_sum <<< ${file1}
read -ra file2_sum <<< ${file2}
IFS=${OLD_IFS}

echo "file 1 is ${file1_sum}"
echo "file 2 is ${file2_sum}"

if [ "${file1_sum}" == "${file2_sum}" ]; then
    echo "The two files are similar"
else
    echo "The two files are different"
fi