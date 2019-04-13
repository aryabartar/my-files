#!/bin/bash

# Author: Arya Khaligh (bartararya@gmail.com)
# Date: 2019 

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

GetInput

XV6_FOLDER="xv6-script"

rm -rf ~/$XV6_FOLDER || echo "Error while removing previous $XV6_FOLDER directory."

mkdir ~/$XV6_FOLDER && cd ~/$XV6_FOLDER

Clone

cd ~/${XV6_FOLDER}/xv6-public

mkdir ../tmp
MakeError $? "Error while making." "Success."
 
make qemu-nox 
MakeError $? "Error running qemu." "Success."
