#! /bin/bash
				#=======================================================================================#
				#			   	select specific column		   	           	#
				#=======================================================================================#
Blue='\033[1;34m'	# Blue color code 
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
NC='\033[0m' 		# No Color
echo -e "${NC}Enter your Database Name : ${Blue}\c${NC}"
read DBname
echo -e "${NC}Your Avilable Tables Are : "`ls ./DBMS/$DBname`
echo -e "Enter Your Table Name : ${Blue}\c${NC}"
read TableName
echo -e "${NC}Your Table Consist of : "
coloumnsCount=`awk -F, 'NR==1 {print NF}' ./DBMS/$DBname/$TableName`
for(( i=1;i<$coloumnsCount;i++ ))
do
	echo -n $i "- "
	grep "%," ./DBMS/$DBname/$TableName | cut -d "," -f$i | cut -d "%" -f2
done
echo -e "${NC}Enter Column Number : ${Blue}\c${NC}"
read colNum
awk 'BEGIN{FS=","}{print $'$colNum'}'  ./DBMS/$DBname/$TableName
  
main_menu/connectToDB.sh # to back to manu again
