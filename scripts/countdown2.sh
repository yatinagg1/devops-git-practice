#!/bin/bash

read -p "Enter a number: " Num

for ((Num;Num>0;Num--))
do
 echo $Num
done
 
echo "Done!"
