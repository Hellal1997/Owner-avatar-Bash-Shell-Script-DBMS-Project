#! /bin/bash
				#=======================================================================================#
				#			   		List Tables		   	           	#
				#=======================================================================================#
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
Blue='\033[1;34m'	# Blue color code 
NC='\033[0m' 		# No Color
echo -e "${NC}enter Database name you want to list it is table : ${Blue}\c${NC}"
read DBname
if [ -d DBMS/$DBname ]
	then
      		if [ `ls DBMS/$DBname -l | wc -l`  -gt 1 ];	# Greater than , wc -l  prints the line count
		then 
         		echo -e "${Green}Your Tables Are : ${NC}"
         		ls DBMS/$DBname
      		else
         		echo -e "${RED}Theie is Not Table to Show${NC}" 
      		fi
  	else
    	  	echo -e "${RED}There Is No Database Called${NC} $DBname"
fi   
main_menu/connectToDB.sh # to back to manu again
