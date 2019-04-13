#!/bin/bash

# Author: Arya Khaligh (bartararya@gmail.com)
# Date: 2019 

Clone () {
    mkdir xv6-public
    cp ~/ali/xv6-public/* ~/$XV6_FOLDER/xv6-public # Why $XV6_FOLDER is accessable?
}

XV6_FOLDER="xv6-script"

rm -rf ~/$XV6_FOLDER
mkdir ~/$XV6_FOLDER && cd ~/$XV6_FOLDER

Clone

cd ~/${XV6_FOLDER}/xv6-public

make
make qemu-nox 
