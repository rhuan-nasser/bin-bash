#!/bin/bash

clear

arqtemp=$(mktemp)

wget "https://www.melhorcambio.com/dolar-hoje" > /dev/null -O 2>&1 "$arqtemp" --no-check-certificate


#comando=$(cat "$arqtemp" | grep -i "input type" | grep  "taxa-comercial" | cut -d\" -f4)
comando=$(cat "$arqtemp" | grep taxa-comercial| awk '{print $3}' | tr -d '[a-z]' | tr -d = | tr -d \")
#grep taxa-comercial dolar-hoje | awk '{print $3}' | tr -d '[a-z]' | tr -d = | tr -d \"


while :
do
 
	date=$(date "+%d/%m/%y %H:%M")
	echo "$date --------------- \$$comando" | tee -a /home/nasser/Desktop/valor-do-dolar 
	sleep 60

done



