#! /bin/bash
				#=======================================================================================#
				#			   	Select from Table		   	           	#
				#=======================================================================================#
Blue='\033[1;34m'	# Blue color code 
Yellow='\033[1;33m'	# Yellow color code
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
NC='\033[0m' 		# No Color
function selectMeun
{
	echo -e "	${Yellow}+=======================================================================================+"
	echo -e "	|			   	  Select from Table Menu	   	           	|"
	echo -e "	|=======================================================================================|"
	echo -e "	|				  1.select all table					|"	
	echo -e "	|				  2.select specific column				|"
	echo -e "	|				  3.Connect To Databases Menu				|"
	echo -e "	|				  4.Main Menu						|"
	echo -e "	|				  5.Exit						|"
	echo -e "	+=======================================================================================+${NC}"
	echo -e "Enter Your Choice : ${Blue}\c${NC}" #\c to get user input in the same line
	read userChoice
	case $userChoice in 
		1) select_table/selectAllTable.sh;;
		2) select_table/selectSpecificColumn.sh;;
		3) main_menu/connectToDB.sh;;
		4) ./main.sh;;
		5) echo -e "${Green}Goodbye${NC}";exit;; #exit from database
		*) echo -e "${RED}invalid choice, try again ... you must choose only from the above list${NC}";mainMeun #Call it again
	esac
}
selectMeun #to call the selectMeun fun in the beginning of the project 
