#! /bin/bash

list_path() {
    echo "Listing path folders"
    old_IFS=$IFS
    IFS=":"
    for i in $PATH; do
        echo $i
    done
    IFS=$old_IFS
}

search_command() {
    if [ -s $1 ]; then
        echo "Please specify a command to search for!"
        return -1
    fi
    found_flag=0
    echo "Searching for command \"$1\""
    old_IFS=$IFS
    IFS=":"
    for dir in $PATH; do
        if [ -e ${dir}/${1} ]; then
            echo "Command found in $dir/$1"
            found_flag=1
        fi
    done
    IFS=$old_IFS
    if [ $found_flag -eq 0 ]; then
        echo "Command was not found in path!"
        return -1
    fi
}

search_folder() {
    if [ "$1" == "" ]; then
        echo "Please specify a folder to search for!"
        return -1
    fi
    echo "Searching for folder $1"
    old_IFS=$IFS
    IFS=":"
    for dir in $PATH; do
        if [[ "$dir" == "$1" || "$dir/" == "$1" ]]; then
            echo "$dir was found in path!"
            IFS=$old_IFS
            return 0
        fi
    done
    IFS=$old_IFS
    echo "$1 was not found in path!"
    return -1
}

echo "********* Path Script *********"

case $1 in
    list)
        list_path
    ;;

    command)
        search_command $2
    ;;

    folder)
        search_folder $2
    ;;
    
    *)
        echo "Usage: path_search OPTION [search_item]"
        echo "OPTION:"
        echo "  list: for listing the folders in path"
        echo "  command: for searching for a specific command in the path"
        echo "  folder: for searching for a specific folder in the path"
    ;;
esac

