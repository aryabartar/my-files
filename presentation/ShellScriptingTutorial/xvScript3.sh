#!/bin/bash

# Author: Arya Khaligh (bartararya@gmail.com)
# Date: 2019 

GetInput () {
    read -p "Run script? [y/N] : " USER_INPUT 
    
    if [ $USER_INPUT = 'y' -o $USER_INPUT = 'Y' ]
    then
        echo -e "Yes, starting... \n\n"
        return 0
    
    elif [ $USER_INPUT = 'N' -o $USER_INPUT = 'n' ]; then
        echo "No"
        exit 0
    
    else
        echo "wrong_input"
        CheckInput
    fi
}

Clone () {
    mkdir xv6-public
    cp ~/ali/xv6-public/* xv6-public
}

MakeError () {
    if [ $1 -ne 0 ]
    then
        echo $2
        exit 1
    else
        echo $3
    fi
}

echo "Running $0 script... "
GetInput

XV6_FOLDER="xv6-script"

rm -rf ~/$XV6_FOLDER || echo "Error while removing previous $XV6_FOLDER directory."

mkdir ~/$XV6_FOLDER && cd ~/$XV6_FOLDER

Clone

cd ~/${XV6_FOLDER}/xv6-public

mkdir ../tmp && make > ../tmp/make-log.txt
MakeError $? "Error while making." "Success."
 
make qemu-nox 
MakeError $? "Error running qemu." "Success."
