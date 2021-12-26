#!/bin/bash

col_info(){
consumo_por_usuario=$(top -b -n 1 | grep "CPU(s)" | awk '{ print $2  }' | cut -d, -f1)
consumo_pelo_kernel=$(top -b -n 1 | grep "CPU(s)" | awk '{ print $4  }' | cut -d, -f1)
ociosidade=$(top -b -n 1 | grep "CPU(s)" | awk '{ print $8  }' | cut -d, -f1)
}

col_info

count=0

while :
do
	col_info
	
	while [ $ociosidade -le 10 ]
	do
		col_info
		if [ $count == 0 ]
		then
			count=$((count+1))

		 	mail -a "Content-Type: text/plain; charset=UTF-8" -s "Consumo de CPU" (Coloque o e-mail aqui sem os "()"!)<<msg
Prezados,  

	O servidor está tendo consumo de $(echo 100-$ociosidade | bc)% do Processador.

TOP 10 Processos que estão consumindo mais CPU:

$(top -b | head -17 | tail -11)
msg
		fi

		if [ $ociosidade -gt 30 ]
		then
			mail -a "Content-Type: text/plain; charset=UTF-8" -s "Consumo de CPU" (Coloque o e-mail aqui sem os "()"!)<<msg
Prezados,  

        O servidor está tendo consumo de $(echo 100-$ociosidade | bc)% do Processador.
msg
			count=0
			break
		fi

	done

	

done
