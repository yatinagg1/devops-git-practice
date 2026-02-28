#!/bin/bash

pkge=("nginx" "curl" "wget")

if [ "$(id -u)" -ne 0 ]; then
 echo "Please login via root to execute this script";
 exit 1;
fi

for i in "${pkge[@]}"; do
 if dpkg -s $i &>/dev/null;
  then
    echo "$i already installed"
  else
    echo "$i is installing"
    apt-get update && apt-get install -y $i;
    if dpkg -s $i &>/dev/null;
     then
      echo "$i installed now!"
     else
      echo "Encountered some issue"
    fi 
 
fi
done
