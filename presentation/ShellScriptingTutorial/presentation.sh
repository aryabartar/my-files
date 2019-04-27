#!/bin/bash

# Author: Arya Khaligh (bartararya@gmail.com)
# Date: 2019 


GetInput() {
    read -p "Run script? [Y/n]" USER_INPUT 

    if [ $USER_INPUT = 'Y' -o $USER_INPUT='y' ]
    then 
        echo "Start script ..."
        return 0

    elif [ $USER_INPUT = 'n' -o $USER_INPUT = 'N' ]
    then 
        echo "Stopping script ..." 
        exit 2
    
    else
        echo "Invalid input"
        GetInput
    fi
}

Clone () {
    mkdir xv6-public
    cp ~/ali/xv6-public/* ~/$XV6_FOLDER/xv6-public # Why $XV6_FOLDER is accessable?
}

MakeError() {
    if [ $1 -ne 0 ]
    then 
        echo $2
        exit 1
    else 
        echo $3
    fi
}

EmptyGit () {
    rm -rf .git 
    git init
    git add -A
    git commit -m "First commit!"
}


GetInput

XV6_FOLDER="xv6-script"

rm -rf ~/$XV6_FOLDER || echo "Failed while removing $XV6_FOLDER"
mkdir ~/$XV6_FOLDER && cd ~/$XV6_FOLDER

Clone

cd ~/${XV6_FOLDER}/xv6-public

mkdir ../tmp && make > ../tmp/make-log.txt
MakeError $? "Fail!" "Success!" 

make qemu-nox 
MakeError $? "Fail!" "Success!" 

EmptyGit