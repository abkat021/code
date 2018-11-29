#!/bin/bash

# NOTE: Because these exercises are examining exit statuses, each exercise
# must be run individually (or should be separated into separate files). The first
# prompt command specifies which exercise should be run -- I have wrapped everything
# in a conditional

read -p "Which exercise do you want to run? " exercise

if [ $exercise -eq 1 ]
then
	echo "Exercise 1:"
	echo "-----------"
	# Write a shell script that displays "This script will exit with a 0 exit status." 
	# Be sure that the script does indeed exit with a 0 exit status.
	echo "This script will exit with a 0 exit status."
	exit 0
elif [ $exercise -eq 2 ]
then
	echo
	echo "Exercise 2:"
	echo "-----------"
	# Write a shell script that accepts a file or directory name as an argument. 
	# Have the script report if it is a regular file, a directory, or other type of file. 
	# If it is a regular file, exit with a 0 exit status. 
	# If it is a directory, exit with a 1 exit status. 
	# If it is some other type of file, exit with a 2 exit status.
	read -p "Enter a file or directory to test in exercise 2: " INPUT

	if [ -f $INPUT ]
	then
		echo "${INPUT} is a regular file -- exiting with status 0."
		exit 0
	elif [ -d $INPUT ]
	then
		echo "${INPUT} is a directory -- exiting with status 1."
		exit 1
	else
		echo "${INPUT} is not a regular file or a directory -- exiting with status 2."
		exit 2
	fi

elif [ $exercise -eq 3 ]
then
	echo
	echo "Exercise 3:"
	echo "-----------"
	# Write a script that executes the command "cat /etc/shadow". 
	# If the command returns a 0 exit status report "Command succeeded" and exit with a 0 exit status. 
	# If the command returns a non­zero exit status report "Command failed" and exit with a 1 exit status.

	cat "/etc/shadow"
	status="$?"

	if [ $status -eq 0 ]
	then
		echo "Comand succeeded"
		exit 0
	else
		echo "Command failed"
		exit 1
	fi

else
	echo "Please enter an integer between 1 and 3. Exiting"
	exit 0
fi
