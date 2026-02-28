#!/bin/bash

read -p "Please enter a number: " NUM

if [ $NUM -gt 0 ]; then
   echo "Number you entered is POSITIVE NUMBER!"
  elif [ $NUM -lt 0 ]; then
      echo "Number you entered is NEGATIVE NUMBER!"
     elif [ $NUM == 0 ]; then
         echo "Number you entered is ZERO!"
     else
         echo "You didn't entered a Number"
fi
