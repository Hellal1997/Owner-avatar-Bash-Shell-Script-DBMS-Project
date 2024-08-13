#! /bin/bash
				#=======================================================================================#
				#			   		Drop Table		   	           	#
				#=======================================================================================#
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
Blue='\033[1;34m'	# Blue color code 
NC='\033[0m' 		# No Color
echo -e "${NC}Please enter Database Name ${Blue}\c ${NC}"
read DBname
if [ -d  ./DBMS/$DBname ]             # to check if this DataBase Exist or not       
 then
        echo -e "${NC}Your Tables are : "
	ls ./DBMS/$DBname
	echo -e "Enter your Table Name You want to Drop: ${Blue}\c${NC}"
	read TableName
	  #-------------- check if table is exist----------------------#
	if [[ -f ./DBMS/$DBname/$TableName ]]
	 then
		rm  ./DBMS/$DBname/$TableName            # to Drop this Table  
	  	echo -e "${Green}$TableName is Dorped Now Successfully${NC}"
	  	echo -e "Now Your Tables are : "
	  	ls ./DBMS/$DBname                        #to list the tables after drop one 
	  	./main_menu/connectToDB.sh    #return to connect menu
	  	                        
	  #-------------- if table is Not exist----------------------#	  	
	else
		 echo -e "${Red}$TableName is already Not exist ${NC}"
		 ./main_menu/connectToDB.sh    #return to connect menu
	fi
else
	echo -e "${RED}$DBname is not Exist${NC}"
fi
main_menu/connectToDB.sh # to back to manu again
