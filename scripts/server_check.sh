#!/bin/bash

read -p "Please enter the service name: " SVC

read -p "Do you want to check the status of the service - $SVC (Y/N): " Var

if [[ "$Var" = [yY]* ]]; then
  STATUS=$(systemctl is-active $SVC);
   echo "Service- $SVC is $STATUS"
  elif [[ "$Var" = [nN]* ]]; then
   echo "Skipped"
 else
   echo "Enter Y or N"
fi
