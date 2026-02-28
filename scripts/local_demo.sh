#!/bin/bash
local_variable_function () {
 local x=10
 echo "Local Variable value inside function: $x"
}
global_variable_function () {
 y=20
 echo "Global Variable value: $y"
}
local_variable_function
echo "Value of x: $x" #x could not be accessed
global_variable_function
echo "Value of y: $y" #y could be accessed
