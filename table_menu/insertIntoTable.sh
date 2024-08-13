#! /bin/bash
				#=======================================================================================#
				#			   	Insert into Table		   	           	#
				#=======================================================================================#
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
Blue='\033[1;34m'	# Blue color code 
NC='\033[0m' 		# No Color
echo -e "${NC}Enter your Database Name : ${Blue}\c${NC}"
read DBname

echo -e "${NC}Avilable tables are : "`ls ./DBMS/$DBname`

echo -e "${NC}Which table you want to insert from : ${Blue}\c${NC}" 
read TableName

row="";
coloumnsCount=`awk -F, 'NR==1 {print NF}' ./DBMS/$DBname/$TableName`

for(( i=1;i<$coloumnsCount;i++ ))
do
	columnNumber=$(echo $i|cut -d ',' -f$i) ;
	echo -n $i "- "
	
	columnType=`grep "%," ./DBMS/$DBname/$TableName | cut -d "," -f$columnNumber | cut -d% -f3`  #to git field 2 datatype
	colName=`grep "%," ./DBMS/$DBname/$TableName | cut -d "," -f$columnNumber | cut -d% -f2`     #to git field 1 cloumn name	

	echo -e "${Blue}Column Name :${NC} $colName , ${Blue}it's Type :${NC} $columnType" 
	
	testPk=`grep "%," ./DBMS/$DBname/$TableName | cut -d "," -f$columnNumber | grep %Pk% | cut -d% -f4` #to git field 3 is PK ?
	
	echo -e "Enter the value of column number ${Blue}$columnNumber${NC} : ${Blue}\c${NC}";
	read  val;
	#validation for string datatype
	
	if test $columnType = "string"
	then
		while [ -z $val ] 2>/dev/null || [[ $val =~ [\,\;\:\-\/\\] ]] || [ "$val" -eq "$val" ] 2>/dev/null
		do
			echo -e "${RED}Invalid input!, empty value or special characters are not allowed${NC}";
			echo -e "Enter the value of column number ${Blue}$columnNumber${NC} : ${Blue}\c${NC}";
			read  val;
		done
	fi

	# Validation for integer datatype
	if test $columnType = "int"
	then
		while ! [ "$val" -eq "$val" ] 2>/dev/null
		do
			echo -e "${RED}Invalid input!, datatype of column number ${NC}$columnNumber${RED} is integer${NC}";
			echo -e "Enter the value of column number ${Blue}$columnNumber${NC} : ${Blue}\c${NC}";
			read  val;
		done
	fi

	#appending row to table with "," as delimeter
	if testPk=='Pk'
	then
		if checkNewValue=`cut -f$columnNumber -d, ./DBMS/$DBname/$TableName | grep -w $val`
		then 
			echo -e "${RED}this value exit${NC}"
			main_menu/connectToDB.sh # to back to manu again 
		else
			if test -z $row
			then
				row=$val
				else
					row=$row","$val;
			fi
		fi
	fi

done
echo "$row" >> ./DBMS/$DBname/$TableName 2> /dev/null
echo -e "${Green}Your Data Updated Sucessfuly${NC}"
main_menu/connectToDB.sh # to back to manu again  
