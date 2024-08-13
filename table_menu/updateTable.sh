#! /bin/bash
				#=======================================================================================#
				#			   		Update Table		   	           	#
				#=======================================================================================#
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color Green
Blue='\033[1;34m'	# Blue color code 
NC='\033[0m' 		# No Color
echo -e "${NC}Enter your Database Name : ${Blue}\c${NC}"
read DBname     

echo -e "${NC}Available Tables in ${Blue}$DBname${NC} is : "
ls DBMS/$DBname
read -p "Please Enter Table Name : " TableName

coloumnsCount=`awk -F, 'NR==1 {print NF}'  ./DBMS/$DBname/$TableName` #get number of cloumn
#-------------------------------------------------------List table cloumn-------------------------------------------------------#
for(( i=1;i<$coloumnsCount;i++ ))
do
	echo -n $i "- "
	colName=`grep "%,"  ./DBMS/$DBname/$TableName | cut -d "," -f$i | cut -d "%" -f2`
	echo -e "${Blue}$colName${NC}"
done

echo -e "Enter The Column Number You Want to Update : ${Blue}\c${NC}"
read colNum
echo -e "${NC}Enter Your New Value : ${Blue}\c${NC}"
read newValue


#-------------------------------------------------------Check Pk-------------------------------------------------------#
if testPk=`grep "%," ./DBMS/$DBname/$TableName | cut -d "," -f$colNum | grep %Pk% | cut -d% -f3`
then 
	if checkNewValue=`cut -f$colNum -d, ./DBMS/$DBname/$TableName | grep -w $newValue`
	then
		echo -e "${RED}this value is exist${NC}"
		main_menu/connectToDB.sh # to back to manu again     
	else


		echo -e "${NC}Enter The Row Number You Want to Update: ${Blue}\c${NC}"
		read cl

		echo -e "${NC}Enter your Old value : ${Blue}\c${NC}"
		read conVal

		awk -F, '$"'$cl'"=="'$conVal'" {$"'$colNum'"="'$newValue'"} {for(i=1 ;i<=NF ;i++ ) { if (i==NF) print $i; else printf     "%s",$i","}}'  ./DBMS/$DBname/$TableName > updatFile
		cat updatFile >  ./DBMS/$DBname/$TableName
	fi
else
	echo -e "${RED}not find pk${NC}"
fi 
#-------------------------------------------------------test Data Type-------------------------------------------------------#
testDataType=`grep "%," ./DBMS/$DBname/$TableName | cut -d "," -f$colNum | cut -d% -f3`
echo $testDataType

if [ $testDataType=="int" ]
then
	if  expr $newValue + 1 2> /dev/null >> /dev/null
	then
		echo -e "${Green}Number${NC}"
	else
		echo -e "${RED}Not a Number${NC}"
	fi
fi

awk -F, '$"'$cl'"=="'$conVal'" {$"'$colNum'"="'$newValue'"} {for(i=1 ;i<=NF ;i++ ) { if (i==NF) print $i; else printf "%s",$i","}}'  ./DBMS/$DBname/$TableName > updatFile
cat updatFile >  ./DBMS/$DBname/$TableName

echo -e "${Green}Your Data Updated Sucessfuly${NC}"
main_menu/connectToDB.sh # to back to manu again  
