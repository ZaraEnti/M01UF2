#!/bin/bash

#elecciones para saber que es lo que tiene que hacer

echo "Seleccciona una opción:"
echo "1. Para leer comentario"
echo "2. Para insertar comentario"
read OPCION

if [ $OPCION -eq 1 ]
then
	echo "SELECT comment, datetime FROM comments;" | mysql faryadventures -u commentarios

elif [ $OPCION -eq 2 ]
then
	echo "Inserta el comentario:"
	read COMMENT

	DIRTYWORDS=`echo "$COMMENT" | grep chorizo`

	if [ "$DIRTYWORDS" == "" ]
	then
	echo "INSERT INTO comments (comment) VALUES ('$COMMENT');" | mysql faryadventures -u commentarios
	echo "Mensaje correcto"
	else
	echo "El comentario contiene palabras prohibidas, no se puede insertar."
	fi
fi
