#!/bin/bash

<< NOTE
 Basic function usage script as 
 user pass arguments 
NOTE
# Calling of script value of arguments
echo $1
echo $2
echo $3
# Defination of greet function
greet ()
{
	echo "Hello, $1"
}
# Function to print addition of 2 numbers
add ()
{
	i=$(($1+$2))  #arguments value changes 2->1 and 3->2
	echo "Sum of $1 + $2 = $i"
}
# calling functions
greet $1 #calling 1st argument to function
add $2 $3 #calling 2nd and 3rd argument to function
