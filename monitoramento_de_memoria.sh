#!/bin/bash

verifica_memoria_disponivel(){
memoria_disponivel=$(free -m | awk '{ print $7  }' | grep [0-9])
}

verifica_memoria_disponivel

while :
do

        while [ $memoria_disponivel -le 2000 ] 
        do
                verifica_memoria_disponivel

                mail -a "Content-Type: text/plain; charset=UTF-8" -s "Consumo acima de 6GB de RAM" rhuan.nasser@iti.gov.br<<msg
Prezados,

    Segue abaixo informações mais detalhadas do consumo de memória
no servidor xpto.

$(for processo in $(ps -e -o pid --sort -size | head -11); do ps -p $processo -o pid,comm= | grep -v PID; done 2>/dev/null)

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
