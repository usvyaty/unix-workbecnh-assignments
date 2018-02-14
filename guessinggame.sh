#! /bin/bash
#Script name:  guessinggame.sh
#
# Author:      Ying Yang
# Date :       13-feb-2018
#
# Description: The following script accept a number from the users input 
#              and compares it with the number of files in teh current directory.  If the input number is different
#              it displays a message stating if it is bigger or smaller and asks for another number. 
#              This continues until the numbers match.
#Run Info      This script runs until the  numbers match or it is cancelled (Cntr-C)
function isvalid_number {
	if [[ ! $1 || $1 =~ [^0-9] ]]
        then return 1			
	else return 0	
        fi
}
function get_number_from_input {
 	local s=${@}
	read -p "$s" in
	while ! (isvalid_number $in) 
	do
                echo "Error: '$in' is not a number" > /dev/stderr 
                read -p "$s" in
        done
	echo $in 
}
function get_number_files {
	echo  $(find -maxdepth $1 -type f  |wc -l)
}

cur_dir=$(pwd)
mess="Guess the number of files in the current directory($cur_dir): "
file_count=$(get_number_files 1)
let guessed_count=file_count+1
while [ $file_count -ne $guessed_count ] 
	do
	guessed_count=$(get_number_from_input $mess)
	[[ $guessed_count -lt file_count ]] && echo "Your guess is too low, please try again"
	[[ $guessed_count -gt file_count ]] && echo "Your guess is too high, please try again" 
done
echo "Well done you have guessed it right!!!"
