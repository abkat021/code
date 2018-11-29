# !/bin/bash
HOSTNAME=$(hostname)
echo "Executing the bashPlay script on ${HOSTNAME}."

# Print all arguments passed in:
echo "These are the positional parameters"
for arg in $@
do
	echo $arg
done

# Create a variable called myName and assign it to the string 'Andrew'
# myName='Andrew'

# Create a variable called myName and assign it to the first argument passed to the script
# myName="$1"

# Prompt the user to enter a name and store the name entered in the variable myName
read -p "Enter a name: " myName

# Print that variable
echo "My name is $myName"

# My first conditional statement
if [ "$myName" = "Andrew" ]
then
	echo "You have set the right value for my name!"
elif [ "$myName" = "Barakat" ]
then
	echo "That's my last name!"
else
	echo "You have set a name that is different from mine!"
fi	

# My first for loop 
COLORS="red green blue"
for COLOR in $COLORS
do
	echo "The color is : $COLOR"
done
