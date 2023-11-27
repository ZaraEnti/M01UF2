#!/bin/bash
#SOY SERVER

CLIENT="10.65.0.72"
PORT="3333"

#mensaje del servidor
echo "EFTP 1.0"
#1 escuchar
echo "(0) Listen"
#guardamos la variable
IP=`nc -l -p $PORT -w 0`
echo $IP

DATA=`nc -l -p $PORT -w 0`

echo $DATA
PROTOCOL=`echo $DATA | cut -d " " -f 1`
echo $PROTOCOL
IP=`echo $DATA | cut -d " " -f 2`
echo $IP
echo "(3) Test & Send"

if [ "$DATA" != "EFTP 1.0" ]
#== solo para strings. Si el de dentro queremos que sea sustido tiene que estar entre comillar ya que si no lo interpretara como un parámetro

then
	echo "Error 1 BADHEADER"
	sleep 1
	echo "KO_HEADER" | nc $CLIENT 3333 #comprobación de la cosas que van mal
	exit 1 #para salir del programa para nuestro progama

fi

echo "OK_HEADER"
sleep 1
echo "OK_HEADER" | nc $CLIENT $PORT

echo "(4) Listen"
DATA=`nc -l -p $PORT -w 0`
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

echo "BOOOM"
sleep 1 #asegura que el otro lado nos este escuchando
echo "BOOOM" | nc $CLIENT $PORT

echo "(8) Listen"
DATA=`nc -l -p $PORT -w 0` #netcat 
echo $DATA

echo "(12) Test&store&send"
PREFIX=`echo $DATA | cut -d " " -f 2` #la -d es el delimitador donde lo corto y la f es el campo 
if [ $PREFIX != "FILE_NAME" ]
then
echo "ERROR 3"
sleep 1
echo "KO_FILE_NAME" | nc $CLIENT $PORT
exit 3
fi
sleep 1
echo "OK_FILE_NAME" | nc $CLIENT $PORT

echo "(13) Listen"
DATA=`nc -l -p $PORT -w 0`
echo $DATA

echo "(16) STORE & SEND"
if [ "$DATA" != "" ]
then
	echo "Error 4: EMTY DATA"
	sleep 1
	echo "KO_DATA" | nc $CLIENT $PORT
	exit 4
fi
echo $DATA > inbox/$FILE_NAME
echo "OK_DATA" | nc $CLIENT $PORT

exit 0
