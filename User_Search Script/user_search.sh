#! /bin/bash

passwd_path="/etc/passwd"
separator=":"

# Check if a username is sent
if [ $# -ne 1 ]; then
    echo "Usage: user_search name"
    exit -1
fi

echo "Searching for user $1"
user_data=$(grep ^$1 ${passwd_path})

# Check if user was found or not
if [ $? -ne 0 ]; then
    echo "User $1 was not found!"
    exit -1
fi

# Backup and change the internal field separator
old_IFS=$IFS
IFS=$separator

read username password uid gid name home shell <<< ${user_data}

IFS=${old_IFS}

echo -e "\nUser is found"
echo "******************"
echo "  User : $username"
echo "  PSW  : $password"
echo "  UID  : $uid"
echo "  GID  : $gid"
echo "  NAME : $name"
echo "  HOME : $home"
echo "  SHELL: $shell"
echo "******************"
