#!/bin/bash

# Script to check disk and memory usage
# Defination of disk utilization function
check_disk ()
{
 echo "root File system Utilization as below"
 df -h / | awk 'NR==2 {print "Total Size: "$2,"\nUsed Space: "$3,"\nFree Space: "$4}'
}
# Defination of memory utilization function
check_memory ()
{
 echo "System Memory Utilisation at present"
 free -h | awk 'NR==2 {print "Total allocated memory: "$2,"\nFree Available memory: "$4}'
}
#Main function defination
main ()
{
 check_disk
 check_memory
}
main
