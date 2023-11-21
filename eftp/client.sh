#!/bin/bash
#el cliente
SERVER="localhost"
echo "EFTP 1.0"

echo "(1) Send"
#problemas de sincronizacion para que no tenga problemas de escucha

#justo encima de enviar al servidor
sleep 1
echo "EFTP 1.0" | nc $SERVER 3333

echo "(2) Listen"

DATA=`nc -l -p 3333 -w 0`

echo $DATA

echo "(5) Test & Send"

if [ "$DATA" != "OK_HEADER" ]
then
	echo "Error 1 BADHEADER"
	exit 1
fi

sleep 1
echo "BOOOM" | nc $SERVER 3333

echo "(6) Listen"
DATA=`nc -l -p 3333 -w 0`
echo $DATA
