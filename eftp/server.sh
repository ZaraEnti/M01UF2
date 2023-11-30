#!/bin/bash
#SOY SERVER

CLIENT="10.65.0.72"
PORT="3333"
TIMEOUT=1
#mensaje del servidor
echo "EFTP 1.0"
#1 escuchar
echo "(0) Listen"
#guardamos la variable
#IP=`nc -l -p $PORT -w $TIMEOUT`
#echo $IP

DATA=`nc -l -p $PORT -w $TIMEOUT`

#echo $DATA
#PROTOCOL=`echo $DATA | cut -d " " -f 1`
#echo $PROTOCOL
#IP=`echo $DATA | cut -d " " -f 2`
#echo $IP
echo "(3) Test & Send"

if [ "$DATA" != "EFTP 1.0" ]
#== solo para strings. Si el de dentro queremos que sea sustido tiene que estar entre comillar ya que si no lo interpretara como un parámetro

then
	echo "Error 1 BADHEADER"
	sleep 1
	echo "KO_HEADER" | nc $CLIENT 3333 
	#comprobación de la cosas que van mal
	exit 1 
	#para salir del programa para nuestro progama

fi

echo "OK_HEADER"
sleep 1
echo "OK_HEADER" | nc $CLIENT $PORT

echo "(4) Listen"
DATA=`nc -l -p $PORT -w $TIMEOUT`
#eschuchamos sin necedsidad else
#es doble comprovacion

echo "(7) Test & Send HANDSHAKE"

if [ "$DATA" != "BOOOM" ]
then
	echo "Error 2 HANDSHAKE"
	sleep 1
	echo "KO_HANDSHAKE" | nc $CLIENT $PORT
	exit 2
fi
sleep 1

echo "OK_HANDSHAKE" | nc $CLIENT $PORT


echo "(8) LISTEN"

DATA=`nc -l -p $PORT -w $TIMEOUT` #netcat 
echo $DATA

echo "(12) Test&store&send"

PREFIX=`echo "$DATA" | cut -d " " -f 1` 
#la -d es el delimitador donde lo corto y la f es el campo 

FILE_NAME=`echo "$DATA" | cut -d " " -f 2`
FILE_MD5=`echo "$DATA" |cut -d " " -f 3`
FILE_MD5_LOCAL=`echo $FILE_NAME | md5sum | cut -d " " -f 1`

#CRC comprobación de errores de redundancia
if [ "$PREFIX" != "FILE_NAME" ]
then
	echo "ERROR 3: BAD FILE NAME PREFIX"
	sleep 1
	echo "KO_FILE_NAME" | nc $CLIENT $PORT
	exit 3
fi

if [ "$FILE_MD5" != "$FILE_MD5_LOCAL" ]
then
	echo "ERROR 3 : BAD FILE NAME MD5"
	sleep 1
	echo "KO_FILE_NAME" | nc $CLIENT $PORT
	exit 3
fi

echo "OK_FILE_NAME" | nc $CLIENT $PORT

echo "(13) Listen"
#directamento lo guardamos como nos llega
nc -l -p $PORT -w $TIMEOUT > inbox/$FILE_NAME
echo $FILE_NAME



echo "(16) STORE & SEND"
#si nos llega vacio si nos sale el error

DATA=`cat inbox/$FILE_NAME`

if [ "$DATA" == "" ]
then
	echo "Error 4: EMTY DATA"
	sleep 1
	echo "KO_DATA" | nc $CLIENT $PORT
	exit 4
fi

echo "OK_DATA" | nc $CLIENT $PORT

echo "(17) LISTEN"

DATA=`nc -l -p $PORT -w $TIMEOUT`
echo $DATA
#lo guardaremos dentro de un archivo que hemos creado en inbox/


echo "(20) TEST $ SEND"
PREFIX=`echo $DATA | cut -d " " -f 1`

if [ "$PREFIX" != "FILE_MD5" ]
then 
	echo "ERROR BAD FILE_MD5"
	exit 4
fi
FILE_MD5=`echo $DATA | cut -d " " -f 2`
FILE_MD5_LOCAL=`cat inbox/$FILE_NAME | md5sum | cut -d " " -f 1`
#terminamos el código
echo "FIN"
exit 0
