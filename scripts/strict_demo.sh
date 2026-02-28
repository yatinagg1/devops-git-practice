#!/bin/bash
set -euo pipefail
read -p "Input which function to call (1/2/3): " input
undefined_variable ()
{
 echo "Function called to demo undefined variables and exit using set -u"
 echo "Variable not defined in script : $output"
}
command_failure ()
{
 echo "Function called to demo command failure and exit using set -e"
 cat file_does_not_exists
}
pipe_failure ()
{
 echo "Function called to demo pipe command failure and exit using set -o pipefail"
 echo "pipe" | cat pipe
}
if [ $input == 1 ]
 then
  undefined_variable
  echo "DONE" #Never executed as function fails
  elif [ $input == 2 ]
   then
    command_failure
    echo "DONE" #Never executed as function fails
    elif [ $input == 3 ]
     then
      pipe_failure
      echo "DONE" #Never executed as function fails
fi
