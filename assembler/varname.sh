#!/bin/bash
for skill in ADa ah yeah; do
	echo " I am ${skill}script"
done
notExce(){for file in $(ls /etc)}
name="Bill"
usr="Mark"
echo "Hi",${name}" and "${usr}
str="Hello, I know you are ${name}! \n"	
echo $str
echo ${#str}
echo `expr index str B`
echo ${str:1:4}
