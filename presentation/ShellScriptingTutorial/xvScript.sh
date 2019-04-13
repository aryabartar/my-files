#!/bin/bash

# Author: Arya Khaligh (bartararya@gmail.com)
# Year: 2019 


CheckInput () {
    read -p "Run script? [y/N] : " USER_INPUT
    if [ $USER_INPUT = 'y' -o $USER_INPUT = 'Y' ]
    then
        echo -e "Yes, starting ... \n\n"
        return 0
    
    elif [ $USER_INPUT = 'N' -o $USER_INPUT = 'n' ]; then
        echo "No"
        exit 0
    
    else
        echo "wrong_input"
        CheckInput
    fi
}

CheckInput

# XV6_FOLDER="xv6-script"

# rm -rf ~/$XV6_FOLDER

# cd ~
# mkdir $XV6_FOLDER && cd $XV6_FOLDER

# mkdir xv6-public
# cp ~/ali/xv6-public/* xv6-public

# cd ~/${XV6_FOLDER}/xv6-public

# mkdir ../tmp
# make > ../tmp/make-log.txt

# if [ $? -ne 0 ]
# then
#     echo "Error while making xv6."
#     exit 1
# fi

# make qemu-nox