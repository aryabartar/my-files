#!/bin/bash

# Author: Arya Khaligh

XV6_FOLDER="xv6-script"

rm -rf ~/$XV6_FOLDER

cd ~
mkdir $XV6_FOLDER && cd $XV6_FOLDER

mkdir xv6-public
cp ~/ali/xv6-public/* xv6-public

cd ~/${XV6_FOLDER}/xv6-public

mkdir ../tmp
make > ../tmp/make-log.txt

if [ $? -ne 0 ]
then
    echo "Error while making xv6."
    exit 1
fi

make qemu-nox