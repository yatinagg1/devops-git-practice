#!/bin/bash

<<note
if [ -z "$1" ];
then
 echo "Usage: $0 <name>"
else
 echo "Hello, $1!"
fi
note

i=$#
for ((i;i>0;i--));
do
 echo "Hello, $1!";
 exit 1;
done
 echo "Usage: $0 <name>"
