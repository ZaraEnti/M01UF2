#!/bin/bash

#elecciones para saber que es lo que tiene que hacer

echo "Seleccciona que quieres hacer"
echo "1. Para leer comentario"
echo "2. Para insertar comentario"
read NUM

if [ $NUM -eq 1 ]
then
	echo "SELECT comments FROM faryadventures" | mysql faryadventures -u commentarios

elif [ $NUM -eq 2 ]
then
	echo "Inserta el comentario"
	read TEXT
	echo "INSERT comments ("$TEXT")" | mysql faryadventures -u commentarios
else
	echo "No has introducido ninguna de las opciones"
fi

