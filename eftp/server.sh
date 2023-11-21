#!/bin/bash
CLIENT="10.65.0.72"

#este el server
#mensaje del servidor
echo "EFTP 1.0"
#1 escuchar
echo "(0) Listen"
#guardamos la variable
DATA=`nc -l -p 3333 -w 0`

echo $DATA

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
echo "OK_HEADER" | nc $CLIENT 3333

echo "(4) Listen"
DATA=`nc -l -p 3333 -w 0`
#eschuchamos sin necedsidad else
#es doble comprovacion

echo "(7) Test & Send HANDSHAKE"

if [ "$DATA" != "BOOOM" ]
then
	echo "Error 2 HANDSHAKE"
	echo "KO_HANDSHAKE" | nc $CLIENT 3333
	exit 2
fi

echo "BOOOM"
sleep 2
echo "BOOOM" | nc $CLIENT 3333

echo "(8) Listen"
DATA=`nc -l -p 3333 -w 0`

echo $DATA

