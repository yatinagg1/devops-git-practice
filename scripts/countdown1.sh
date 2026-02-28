#!/bin/bash

read -p "Enter a number: " Num

while [ $Num -gt 0 ]
do
 echo $Num
 sleep 2 
 ((Num--))
done

echo "Done!"
