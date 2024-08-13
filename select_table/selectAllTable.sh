#! /bin/bash
				#=======================================================================================#
				#			   	     select all table		   	           	#
				#=======================================================================================#
Blue='\033[1;34m'	# Blue color code 
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
NC='\033[0m' 		# No Color
echo -e "${NC}Enter your Database Name : ${Blue}\c${NC}"
read DBname
         #------------- check if this DataBase Exist or not ---------#
if [ -d  ./DBMS/$DBname ]                                                                       
 then
	if [ `ls DBMS/$DBname -l | wc -l`  -gt 1 ];	                                                               # Greater than , wc -l  prints the line count
		then 
         		echo -e "${NC}Your Tables are : "`ls ./DBMS/$DBname`
      		else
         		echo -e "${RED}Your Table is Empty${NC}" 
      	fi
	echo -e "Enter Table Name: ${Blue}\c${NC}"
	read TableName
	if [ -f DBMS/$DBname/$TableName ]
	     then
	         #column -t -s '%' $tName 2>>./.error.log                                                             #column used to display the contents of a file in columns.
		  #cat  DBMS/$DBname/$TableName 2>>./.error.log 
		  sed '1d;' DBMS/$DBname/$TableName 2>>./.error.log 
		  if [[ $? != 0 ]]
			  then
			    echo -e "${Red}Error Displaying Table $tName${NC}"
			  else
			   echo -e "${Green}Your Operation is Success${NC}"
			   main_menu/connectToDB.sh 
	         fi
        else
            echo -e "${RED}$TableName is not Exist${NC}"
	    main_menu/connectToDB.sh                                                                                   # to back to manu again
       fi 	    
 else
       echo -e "${RED}$DBname is not Exist${NC}"
	main_menu/connectToDB.sh                                                                                       # to back to manu again

fi
