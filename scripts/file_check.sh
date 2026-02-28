#!/bin/bash

read -p "Please enter a file name: " file

if [ -f $file ]; then
  echo "File - $file exists!"
else
  echo "File - $file does not exists!"
fi
