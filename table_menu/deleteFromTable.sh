#! /bin/bash
				#=======================================================================================#
				#			   	Delete from Table		   	           	#
				#=======================================================================================#
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
NC='\033[0m' 		# No Color
echo -e "${NC}Please enter Database Name ${Blue}\c ${NC}"
read DBname
if [ -d  ./DBMS/$DBname ]                                                                         # to check if this DataBase Exist or not       
 then
        echo -e "${NC}$DBname ${Green}is Existing :)${NC}"
        echo -e "Your Tables:"
	ls ./DBMS/$DBname
	echo -e "Enter your Table Name You want to Delete from : ${Blue}\c${NC}"
	read TableName
	  #-------------- check if table is exist----------------------#
	if [[ -f ./DBMS/$DBname/$TableName ]]
	 then
	 	echo -e "Your Columns :"
	 	echo -e "${Blue}PK,Name,Track${NC} :"
	 	sed '1d;' DBMS/$DBname/$TableName 2>>./.error.log                                                      #to show the columns 
		echo -e "${NC}Enter primary key of which row you want to delete :${Blue}\c${NC}"
		read PK
		row=`awk -F, '{{if(($1=='$PK')){print NR}}}' ./DBMS/$DBname/$TableName`            #to get the row number
		sed -i ''$row'd' ./DBMS/$DBname/$TableName                                         #The -i option comes in handy to edit the original file itself, to dete the row.  
		echo line $row deleted successfully                                                #to list the tables after drop one 
	  	./main_menu/connectToDB.sh                                                         #return to connect menu
	  	                        
	  #-------------- if table is Not exist----------------------#	  	
	else
		 echo -e "${NC}${Red}$TableName is Not exist ${NC}"
		 ./main_menu/connectToDB.sh    #return to connect menu
	fi
else
	echo -e "${RED}$DBname is Not Exist${NC}"
	./main.sh
fi
