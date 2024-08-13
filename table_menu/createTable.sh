#! /bin/bash
				#=======================================================================================#
				#			   		Create Table		   	           	#
				#=======================================================================================#
Blue='\033[1;34m'	# Blue color code 
RED='\033[1;31m'	# Red color code 
Green='\033[1;32m'	# Green color code
Yellow='\033[1;33'     # Yellow color code 
NC='\033[0m' 		# No Color		
echo -e "${NC}Enter your Database Name : ${Blue}\c${NC}"
read DBname
         #------------- check if this DataBase Exist or not ---------#
if [ -d  ./DBMS/$DBname ]             # to check if this DataBase Exist or not       
 then
	if [ `ls DBMS/$DBname -l | wc -l`  -gt 1 ];	# Greater than , wc -l  prints the line count
		then 
         		echo -e "${NC}Your Tables are : "`ls ./DBMS/$DBname`
      		else
         		echo -e "${RED}Your Table is Empty${NC}" 
      	fi
	echo -e "${NC}Enter your New Table Name: ${Blue}\c${NC}"

	read TableName
	#-------------- check valid table name -----------------------#
	 if [[ ! $TableName =~  ^[a-zA-Z]+[a-zA-Z0-9]*$ ]] || [[ $TableName == '' ]]   #(~) to tell the next is Regular Expression, (+) one or more occurrences of the preceding element concatenat
	    then
		echo -e "${RED}Not a Valid Name for Table${NC}"
		
       #-------------- check if table is exist----------------------#
	   elif [[ -f ./DBMS/$DBname/$TableName ]]
	     then
		  echo -e "${Green}$TableName is already exist ${NC}"
		  ./main_menu/connectToDB.sh    #return to connect menu
	    else
		  touch ./DBMS/$DBname/$TableName
	fi
     #---------------get columns Data--------------------------------#
    
 echo -e "${NC}Enter your Number of Column : ${Blue}\c${NC}"
 read colNum
while [ $colNum -le 0 ]                       # to check the entered number > 0  while 1
do
      echo -e "${Yellow}please enter invalid number${NC}"
      echo -e "Enter your Number of Column : ${Blue} \c${Nc}"
      read colNum
    
done                                          #End of While1
i=1
seperator=","
pkey="true"
 metaData="$colName""$ColType"$pkey"$seperator"  # the output data abiut each colunm    

while [ $i -le $colNum ]                     # loop to get all data for each column  while 2
do
    echo -e "${NC}Enter Name of column Number $i : ${Blue}\c${NC}"
    read colName

   if [ -z "$colName" ]                     #test for empty colunm name if 1
       then
	       echo -e "${Red}colum name can not be empty${NC}";
	       echo -e "Enter your column Name : ${Blue}\c${NC}";
	       read colName;
   fi                                       #end if 1      
   echo -e "${NC}data type of cloumn $colName"

   
    select typ in "int" "string"           # to select the constrain of the column
    do
       case $typ in
                 int )
                      colType="int"
                         break ;;
               string )
                       colType="string"
                        break     ;;
                        
                    * )
                        echo -e "${Red} This choice is wrong ${NC}"   ;;
        esac                                # end of the select
    done                                    # end of while 2
     
    if [ $pkey=="true" ]                   # to make this column Primary key or Not  if 2                      
      then
        echo -e "Do you want to make it a primaryKey? [y/n] : \c"
         read choice
         case $choice in
                    [Yy] )
                     pkey="Pk"
                     metadata+="%"$colName"%"$colType"%"$pkey"%"$seperator
                            ;;
                     [Nn] ) 

                              metadata+="%"$colName"%"$colType"%"$seperator
                               ;;
                              
                        * )
                            echo -e"${Red}invalid choice ${NC}"
         esac
         
         else
          metadata+="%"$colName"%"$colType"%"$seperator
    fi                                    #end if 2

   

((i=$i+1))                              # to increase i by 1 
done                                    #end while 2  

  echo $metadata  >> ./DBMS/$DBname/$TableName 2>>./.error.log
  

 if [ $? == 0 ]                        # to check the last run by the right way
     then 
       echo -e "${Green}Table create successfuly ${NC}"
     else
       echo -e"${Red} ther are error can not create  $TableName ${NC}"
   fi
    main_menu/connectToDB.sh # to back to manu again

else
       echo -e "${RED}$DBname is not Exist${NC}"
	main_menu/connectToDB.sh # to back to manu again

fi
