#!/bin/bash
## pedir datos de conexión:
echo "Please enter you user database name:"
read userDb
read -s -p "Password:" passDb
echo "\n"
echo "Enter host name:"
read hostName

## preguntar con que base de datos trabajar:
declare varDatabases="$(echo 'show databases' | mysql -u ${userDb} --password=${passDb} -h ${hostName} | tr ' ' '\n')"
echo ${varDatabases}
echo "Write the name of the dabatase that you want for work:"
read databaseName

## generar archivos csv
declare varString="$(echo 'show tables' | mysql -u ${userDb} --password=${passDb} -h ${hostName} ${databaseName} | tr '\n' ' ')"
declare -r -a varArray=(${varString})
unset varString



for i in "${varArray[@]}"
do
	#query="$(echo 'SELECT * FROM ' ${i})"
	#query2="$(echo 'SELECT * FROM ' ${varArray[1]} | mysql -u ${userDb} --password=${passDb} -h ${hostName} ${databaseName} | tr '\n' ' ')"
	tmpFile="'/tmp/$i.csv'"
	echo ${tmpFile}
#	fieldsTerminated="','"
#	enclosed="'\"'"
#	terminated="'\n'"
#	echo 'SELECT * FROM' $i 'INTO OUTFILE' ${tmpFile} 'FIELDS TERMINATED BY' ${fieldsTerminated} 'ENCLOSED BY' ${enclosed} 'LINES TERMINATED BY' ${terminated} | mysql -u ${userDb} --password=${passDb} -h ${hostName} ${databaseName}
 
	#echo ${query2}
done

#echo ${varArray[1]}
#echo ${varArray[2]}
#echo ${varArray[3]}
