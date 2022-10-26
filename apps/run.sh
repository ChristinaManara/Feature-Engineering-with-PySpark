#!/bin/bash
clear
echo "==========================="
echo "Welcome!"
echo "==========================="

# Bash Menu Script Example
COLUMNS=12
PS2='Please enter your choice: '
options=("Testing with a word count example." "Feature Engineering on cvas_data." "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Testing with a word count example.")
            echo "Testing..."
            bash ./testing/test.sh
            ;;
        "Feature Engineering on cvas_data.")
            echo "----Feature Engineering----"
            bash ./feature-engineering/main.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid Option $REPLY";;
    esac
done