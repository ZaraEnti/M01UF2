#!/bin/bash

#script que nos notificará que ha abierto un archivo llamado topsecret

path="/home/enti/M01UF2/M01UF3/avisos"


inotifywait -m $path  | read directorio proceso archivo

if [ "$archivo" == "topsecret" ]
then
	echo "SOS un intruso tiene acceso a la contraseña."
fi


exit 0
