#!/bin/bash

#SCRIPT DE VILLANCICO CANTADO EN CATALÀ

festival --tts letra.txt --language catala

echo "cat letra.txt" | cowsay -f snowman1
