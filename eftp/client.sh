#!/bin/bash
#SOY CLIENTE

#varieables que los sustituyo dentro de todo el código para que se más leible
PARAMETRO=`echo $#`
if [ "$#" -eq 0 ]
then
	SERVER="localhost"
elif [ "$#" -eq 1 ]
then
	SERVER=$1
fi

echo $0
echo $1
<<<<<<< HEAD
# para saber si me hja dado un parametro
SERVER="10.65.0.60"
IP="10.65.0.72"
=======

#VARIABLES
SERVER="localhost"
IP=`ip address | grep inet | grep enp0s3 | cut d " " -f 6 | cut d "/" -f 1`
>>>>>>> 1614332ac318b7f73a05a7d4cdcf2bd03377e193
PORT="3333"
TIMEOUT=1

#PROTOCOLO
echo "EFTP 1.0"

#PARTE1: SOY CLIENTE COMPROBAR CONEXIÓN
echo "(1) Send"

echo "EFTP 1.0" | nc $SERVER $PORT

echo "(2) LISTEN"

DATA=`nc -l -p $PORT -w $TIMEOUT`
echo $DATA

echo "(5) TEST & SEND" 
#envio siempre con el listen

if [ "$DATA" != "OK_HEADER" ]
then
	echo "Error 1 BADHEADER"
	exit 1
fi

echo "BOOOM"

sleep 1
echo "BOOOM" | nc $SERVER $PORT

echo "(6) LISTEN"

DATA=`nc -l -p $PORT -w $TIMEOUT`
echo $DATA

echo "(9) TEST"

if [ "$DATA" != "OK_HANDSHAKE" ]
then
	echo "ERROR 2 : BAD_HANDSKEAK"
	exit 2
fi

echo "OK_HANDSHAKE GOOD"

FILE_NAME="fary1.txt"
FILE_MD5=`echo fary1.txt | md5sum | cut -d " " -f 1`

echo "(10)SEND FILE"

echo "FILE AND MD5 SENDED"
sleep 1
echo "FILE_NAME $FILE_NAME $FILE_MD5" | nc $SERVER $PORT


echo "(11)Listen"

DATA=`nc -l -p $PORT -w $TIMEOUT`
echo $DATA

echo "(14) Test&send"


if [ "$DATA" != "OK_FILE_NAME" ] #puede que llegue vacias DATA

then
	echo "Error 4"
	sleep 1
	echo "Error KO_FILE_NALE" | nc $SERVER $PORT
	exit 3
fi
sleep 1
cat imgs/fary1.txt | nc $SERVER $PORT

echo "(15) LISTEN"

DATA=`nc -l -p $PORT -w $TIMEOUT`
echo $DATA

#es el md5 del archivo que 
echo "(18) SEND"

if [ "$DATA" != "OK_DATA" ]
then
	echo "Error 4"
	sleep 1
	echo "KO_DATA"
fi

#enviar el contenido del archivo y su md5
FILE_MD5=`cat imgs/$FILE_NAME| md5sum| cut -d " " -f 1`
sleep 1
echo "FILE_MD5 $FILE_MD5" | nc $SERVER $PORT
sleep 1


echo "(19) LISTEN"

DATA=`nc -l -p $PORT -w $TIMEOUT`
echo $DATA
echo "(21) TEST"
if [ "$DATA" != "OK_FILE_MD5" ]
	then
	echo "ERROR: FILE_ MD5"
	exit 5
fi

echo "FIN"
exit 0
