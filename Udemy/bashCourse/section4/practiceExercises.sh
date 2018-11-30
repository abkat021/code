#!/bin/bash

echo "Exercise 1:"
echo "-----------"
# Write a shell script that consists of a function that display the number of files in the present working directory. 
# Name this function "file_count" and call it in your script. If you use a variable in your function, remember to make 
# it a local variable.

# Hint: The wc utility is used to count the number of lines, words, and bytes.

file_count(){
	ls -l | wc -l
	# fileList="$(ls -l $PWD)"
	# num=$(wc -l "$fileList")
	# echo $num
}

file_count

echo
echo "Exercise 2:"
echo "-----------"

# Modify the script from the previous exercise. Make the "file_count" function accept a directory as an argument. 
# Next have the function display the name of the directory followed by a colon. 
# Finally, display the number of files to the screen on the next line. 
# Call the function three times. First, on the "/etc" directory, next on "/var" directory and finally on 
# the "/usr/bin" directory.

#Example output:
	# /etc:
	# 85

file_count2(){
	if [ -d $1 ]
	then
		echo "${1}:"
		ls -l $1 | wc -l
	else
		echo "${1} is not a directory -- setting exit status 1"
		exit 1
	fi
}

file_count2 "/etc"
file_count2 "/var"
file_count2 "/usr/bin"

exit 0