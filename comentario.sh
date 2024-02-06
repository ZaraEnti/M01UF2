#!/bin/bash
#Creación del archivo si no existe

ARCHIVO="/home/enti/M01U/home/enti/M01UF2/log_user.txt"
# almacenamiento de los usurario que estan logueados
who >> $ARCHIVO

