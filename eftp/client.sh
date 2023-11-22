#!/bin/bash
#SOY CLIENTE

#varieables que los sustituyo dentro de todo el código para que se más leible
IP=`10.65.0.72/24`
PORT="3333"
SERVER="localhost"

echo "EFTP 1.0 IP"
echo $IP

echo "(1) Send"
#problemas de sincronizacion para que no tenga problemas de escucha

#justo encima de enviar al servidor
sleep 1
echo "EFTP 1.0" | nc $SERVER PORT

echo "(2) Listen"

DATA=`nc -l -p PORT -w 0`

echo $DATA

echo "(5) Test & Send"

if [ "$DATA" != "OK_HEADER" ]
then
	echo "Error 1 BADHEADER"
	exit 1
fi

sleep 1
echo "BOOOM" | nc $SERVER PORT

echo "(6) Listen"
DATA=`nc -l -p PORT -w 0`
echo $DATA
