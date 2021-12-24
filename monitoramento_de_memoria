#!/bin/bash

verifica_memoria_disponivel(){
memoria_disponivel=$(free -m | awk '{ print $7  }' | grep [0-9])
}

while :
do

	while [ $memoria_disponivel -le 2000 ] 
	do
		verifica_memoria_disponivel

		mail -a "Content-Type: text/plain; charset=UTF-8" -s "Consumo acima de 6GB de RAM" exemplo@servidor.com<<msg
Prezados,

    Segue abaixo informações mais detalhadas do consumo de memória
no servidor xpto.

$(ps -eo pid,%mem,cmd --sort=-%mem | head -11 | cut -d- -f1)
msg

verifica_memoria_disponivel
       
	while [ $memoria_disponivel -le 2300  ]
	do
		verifica_memoria_disponivel
		sleep 60
	done

	done

verifica_memoria_disponivel

done
