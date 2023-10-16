#! /bin/bash

if [ $# -eq 0 ]; then
    echo "USAGE: png_conv [File-1] [File-2] ... [File-n]"
    exit -1
fi

for i in $@; do
    if [ -f $i ]; then 
        convert $i $i.png
    else
        echo "ERROR: $i is not a file"
        exit -1
    fi
done

echo "[+] File conversion completed..."
exit 0
