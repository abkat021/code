#!/bin/bash

echo "Exercise 1:"
echo "-----------"
# Hint 1: Remember to make the shell script executable with the chmod command.
# Hint 2: Remember to start your script with a shebang!

# Write a shell script that prints "Shell Scripting is Fun!" to the screen.
echo "Shell Scripting is Fun!"
# Outside of this script, run chmod +x practiceExercises.sh

echo
echo "Exercise 2:"
echo "-----------"
# Modify the shell script from exercise 1 to include a variable. The variable will hold the contents of the message "Shell Scripting is Fun!".
printStr="Shell Scripting is Fun! (Stored as a variable)"
echo $printStr

echo
echo "Exercise 3:"
echo "-----------"
# Store the output of the command "hostname" in a variable. Display "This script is running on _______." where "_______" is the output of the 
# "hostname" command.
HOSTNAME=$(hostname)

# Hint: It's a best practice to use the ${VARIABLE} syntax if there is text or characters that directly precede or follow the variable.
echo "This script is running on ${HOSTNAME}."


echo
echo "Exercise 4:"
echo "-----------"
# Write a shell script to check to see if the file "/etc/shadow" exists. If it does exist, display "Shadow passwords are enabled." 
if [ -e "/etc/shadow" ]
then
	echo "Shadow passwords are enabled."
fi

# Next, check to see if you can write to the file. If you can, display "You have permissions to edit /etc/shadow." 
# If you cannot, display "You do NOT have permissions to edit /etc/shadow."
if [ -w "/etc/shadow" ]
then
	echo "You have permissions to edit /etc/shadow"
else
	echo "You do NOT have permissions to edit /etc/shadow."
fi

echo
echo "Exercise 5:"
echo "-----------"
# Write a shell script that displays "man", "bear", "pig", "dog", "cat", and "sheep" to the screen with each appearing on a separate line. 
# Try to do this in as few lines as possible.
# Hint: Loops can be used to perform repetitive tasks.
animals="man bear pig dog cat sheep"
for animal in $animals
do
	echo $animal
done

echo
echo "Exercise 6:"
echo "-----------"
# Write a shell script that prompts the user for a name of a file or directory and reports if it is a regular file, a directory, or other 
# type of file. Also perform an ls command against the file or directory with the long listing option.
read -p "Enter a file or directory: " INPUT

if [ -f $INPUT ]
then
	echo "${INPUT} is a regular file."
elif [ -d $INPUT ]
then
	echo "${INPUT} is a directory"
else
	echo "${INPUT} is another type of file"
fi

ls -l $INPUT

echo
echo "Exercise 7:"
echo "-----------"
# Modify the previous script so that it accepts the file or directory name as an argument instead of prompting the user to enter it.
INPUT2=$1

if [ -f $INPUT2 ]
then
	echo "${INPUT2} is a regular file."
elif [ -d $INPUT2 ]
then
	echo "${INPUT2} is a directory"
else
	echo "${INPUT2} is another type of file"
fi

echo "Listing contents of ${INPUT2}:"
ls -l $INPUT2

echo
echo "Exercise 8:"
echo "-----------"
# Modify the previous script to accept an unlimited number of files and directories as arguments. 
# Hint: You'll want to use a special variable.
INPUT3=$@

for i in $INPUT3
do
	if [ -f $i ]
	then
		echo "${i} is a regular file."
	elif [ -d $i ]
	then
		echo "${i} is a directory"
	else
		echo "${i} is another type of file"
	fi
	echo "Listing contents of ${i}:"
	ls -l $i
done


