#!/bin/bash
#SOY CLIENTE

#varieables que los sustituyo dentro de todo el código para que se más leible
IP=`10.65.0.72/24`
PORT="3333"
SERVER="localhost"

echo $IP

echo "(1) Send"
#problemas de sincronizacion para que no tenga problemas de escucha

echo "EFTP 1.0"
#justo encima de enviar al servidor
sleep 1
echo "EFTP 1.0" | nc $SERVER $PORT

echo "(2) Listen"

DATA=`nc -l -p $PORT -w 0`

echo $DATA

echo "(5) Test & Send" 
#envio siempre con el listen

if [ "$DATA" != "OK_HEADER" ]
then
	echo "Error 1 BADHEADER"
	exit 1
fi
echo "BOOOM"
sleep 1
echo "BOOOM" | nc $SERVER $PORT

echo "(6) Listen"
DATA=`nc -l -p $PORT -w 0`
echo $DATA

echo "(9) Test"
if [ $DATA != "OK_HANDSHAKE" ]
then echo "ERROR 2 : BAD_HANDSKEAK"
exit 2
fi
echo "OK_HANDSHAKE GOOD"

echo "(10)SEND"
echo "Enviar archivo"
sleep 1
echo "FILE_NAME fary1.txt" | nc $SERVER $PORT


echo "(11)Listen"
DATA=`nc -l -p $PORT -w 0`
echo $DATA
echo "(14) Test&send"
if [ $DATA != "OK_FILE_NAME" ]
then
echo "Error 4"
sleep 1
echo "Error KO_FILE_NALE" | nc $SERVER $PORT
exit 3
fi
cat /home/enti/M01UF2/eftp/fary1.txt | nc $SERVE $PORT
