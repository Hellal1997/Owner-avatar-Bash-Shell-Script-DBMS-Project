#! /bin/bash
				#=======================================================================================#
				#			   	   Connect To Databases		   	           	#
				#=======================================================================================#
Yellow='\033[1;33m'	# Yellow color code
Blue='\033[1;34m'	# Blue color code 
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
NC='\033[0m' 		# No Color
function connectToDB
{
	echo -e "	${Yellow}+=======================================================================================+"
	echo -e "	|			   		Main Menu		   	           	|"
	echo -e "	|=======================================================================================|"
	echo -e "	|				    1.Create Table					|"	
	echo -e "	|				    2.List Tables					|"	
	echo -e "	|				    3.Drop Table					|"	
	echo -e "	|				    4.Insert into Table					|"	
	echo -e "	|				    5.Select from Table					|"
	echo -e "	|				    6.Delete from Table					|"
	echo -e "	|				    7.Update Table					|"
	echo -e "	|				    8.Main Menu						|"
	echo -e "	|				    9.Exit						|"
	echo -e "	+=======================================================================================+${NC}"
	echo -e "Enter Your Choice : ${Blue}\c${NC}" #\c to get user input in the same line
	read userChoice
	case $userChoice in 
		1) table_menu/createTable.sh;;
		2) table_menu/listTable.sh;;
		3) table_menu/dropTable.sh;;
		4) table_menu/insertIntoTable.sh;;
		5) table_menu/selectFromTable.sh;;
		6) table_menu/deleteFromTable.sh;;
		7) table_menu/updateTable.sh;;
		8) ./main.sh;;
		9) echo -e "${Green}Goodbye${NC}";exit;; #exit from database
		*) echo -e "${RED}invalid choice, try again ... you must choose only from the above list${NC}";connectToDB #Call it again
	esac
}
connectToDB #to call the mainFunction in the beginning of the project 
