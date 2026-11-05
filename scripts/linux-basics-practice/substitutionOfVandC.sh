#! /bin/bash
#In this code we will perform both Variable substitution and Command Substitution
#Command Substitution
length=$(echo -n "Rama" | wc -c)
#Variable Substitution
echo "The length of the given String : $length"
#Now we will use dynamic value instead of predefined value
lengthV2=$(echo -n "$1" | wc -c)
echo "The length of the given String $1 : $lengthV2"