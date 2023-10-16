#! /bin/bash

ARRAY=(
    "The greatest glory in living lies not in never falling, but in rising every time we fall. - Nelson Mandela"
    "The way to get started is to quit talking and begin doing. - Walt Disney"
    "Your time is limited, don't waste it living someone else's life. - Steve Jobs"
    "If life were predictable it would cease to be life, and be without flavor. - Eleanor Roosevelt"
    "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success."
)

# Generate a random number between 0 and 4
index=$(($RANDOM%5))

echo ${ARRAY[index]}
