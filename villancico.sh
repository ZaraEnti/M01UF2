#!/bin/bash

#SCRIPT LEER ARCHIVO PARA CONT LEER ARCHIVO PARA CONVERTIRLO EN MP3

echo "Introduce el archivo que quieres reproducir"
read FILE

FILECUT=`cut FILE -d "." -f 1`

echo -e "\033[41m"
cat $FILE | cowsay -f snowman

FILEWAVE=`cat $FILE | text2wave`
echo "$FILEWAVE" >> file.wave
FILEMP3=`lame file.wave`

mpg123 $FILEMPG3 $FILECUT.mp3

echo -e "\033[0m"
