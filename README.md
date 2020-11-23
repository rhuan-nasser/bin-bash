#!/bin/bash

clear


# INÍCIO DA ESTRUTURA DE REPETIÇÃO
while :; do

# VARIÁVEIS GLOBAIS

#################################################################### REDE
HORAUP="`uptime -s | awk '{print $2}'`"
DIAUP="`uptime -s | awk '{print $1}'`"
MEUIP="`hostname -I | awk '{print $1}'`"
RESOLV="`cat /etc/resolv.conf | grep "domain " | awk '{print $2}'`"
GWPADRAO="`route -n | head -3 | grep 0.0 | awk '{print $2}'`"
INTERFACESREL="`ifconfig -a | egrep "*: flags" | awk '{print $1}' | tr -d :`"

#################################################################### OUTROS
NOMECPU="`grep "model name" /proc/cpuinfo | tail -1 | cut -d: -f2`"
QTDCPU="`grep "cpu cores" /proc/cpuinfo | tail -1 | awk '{print $4}'`"
PROCESSEX="`ps aux | wc -l`"

# FUNÇÕES
function FUNCAOINFOR {

		    echo "Ligado desde às $HORAUP do dia $DIAUP" 
		    echo "==================================================================================="
		    echo " ___ _   _ _____ ____      _    
|_ _| \ | |  ___|  _ \    / \   
 | ||  \| | |_  | |_) |  / _ \  
 | || |\  |  _| |  _ <  / ___ \ 
|___|_| \_|_|   |_| \_\/_/   \_/
          	"
			echo "==================================================================================="
			echo "Host --------------------------- `hostname` " 
			echo "IP -----------------------------  $MEUIP"
			echo "GW -----------------------------  $GWPADRAO/24"            
			echo "==================================================================================="
			echo "Interfaces:"
			echo
			echo "$INTERFACESREL"  
			echo "==================================================================================="
}

function FUNCAOINFOR1 {

   echo " `date | awk '{print $1,$2,$3,$4,$5}'`"
   echo
   echo -e " CPU:$NOMECPU" "$QTDCPU Núcleos"
   echo " $PROCESSEX Processos em execução."
}


# CONDIÇÃO DE USUÀRIO ROOT USANDO O IF
if [ $USER = root ];
then

FUNCAOINFOR


 																				
echo
echo "Escolha uma das opções: "
echo "						  "
echo "1 - REDE"
echo "2 - SERVIDOR"

echo
echo

echo -e "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\v\v\v\v\v\v\v\v\vPressione CTRL + C para SAIR"
read OP


# INPUT 1ª CASE
case $OP in

1) 

	clear
	
	FUNCAOINFOR

	echo "1) LOCALHOST - Interface(s) de Rede"
	echo "2) LOCALHOST - Rotas Configuradas"
	echo "3) LOCALHOST - Estatísticas básicas de pacotes ENVIADOS e RECEBIDOS"
    echo "4) LOCALHOST - Conexões de uma porta específica"
    echo "5) LOCALHOST - Conexões TCP e UDP ESTABELECIDAS"
    echo "6) LOCALHOST - Conexões TCP e UDP em LISTEN"
    echo "7) LOCALHOST e OUTROS - Análise do tráfego de Rede"
    echo "8) Rede Wireless"
    echo

    read OP1

    
    #INPUT 2ª CASE

    case $OP1 in

    	1) 

		   clear

		   FUNCAOINFOR
		   
		   echo "1 - Configurar IP Estático"
		   echo "2 - Ver a interface de rede somente"
		   echo

		   read OP2
		   
		    #INÍCIO DO IF DO MENU DE CONFIGURAÇÃO DE IP ESTÁTICO E VISUALIZAÇÃO DE INTERFACE

			   if [ $OP2 = 1 ];
			   then

			   		clear

		   			FUNCAOINFOR

					echo "1 - Red Hat"
					echo "2 - Debian"
					echo

					read OP3

					
					# INÍCIO DO IF DO MENU DE ESCOLHA DO RED HAT OU DEBIAN
					
					if [ $OP3 = 1 ]; 
					then
						
						clear

						FUNCAOINFOR

						echo "Red Hat"
						echo

						read -p "Interface: " IFACE
						read -p "IP Estático: " IP
						read -p "Netmask: " MASK
						read -p "Gateway: " GW
						read -p "DNS: " DNS

						echo "" > /etc/sysconfig/network-scripts/ifcfg-$IFACE
						echo -e "BOOTPROTO="static" \nDEVICE="$IFACE" \nONBOOT="yes" \nIPADDR="$IP" \nNETMASK="$MASK" \nGATEWAY="$GW" \nDNS="$DNS"" > /etc/sysconfig/network-scripts/ifcfg-$IFACE
						systemctl restart network

						clear

						ifconfig $IFACE

						
						echo 
						echo -e "\t\t\t\t\t\t\t\t\t\t\t\t\tTecle ENTER para sair"

						read 


						clear



						elif [ $OP3 = 2 ];
						then
						
						clear

						FUNCAOINFOR

						echo "Debian"
						echo

						read -p "Interface: " IFACE
						read -p "IP Estático: " IP
						read -p "Netmask: " MASK
						read -p "Gateway: " GW
						read -p "DNS: " DNS

						echo "" > /etc/network/interfaces
						echo -e "auto lo $IFACE \niface lo inet loopback \n\n\niface $IFACE inet static \naddress $IP \nnetmask $MASK \ngateway $GW \ndns-nameserver $DNS" > /etc/network/interfaces 
						systemctl restart networking

						clear

						ifconfig $IFACE
 
						echo 
						echo -e "\t\t\t\t\t\t\t\t\t\t\t\t\t Tecle ENTER para sair"

						read 


					else [ $OP = '*' ];

						FUNCAOINFOR

						echo "Opção incorreta!"
					fi

					# FIM DO IF DO MENU DE ESCOLHA DO RED HAT OU DEBIAN
			

				elif [ $OP2 = 2 ];
			    then
		
	    		clear
	    		
	     		FUNCAOINFOR

	    		ifconfig
	
	    		read
			    
			    fi
			    #FIM DO IF DO MENU DE CONFIGURAÇÃO DE IP ESTÁTICO E VISUALIZAÇÃO DE INTERFACE
		   ;;
		   #INPUT 2ª CASE


		2) clear
		   
		   FUNCAOINFOR

		   route -n
		   read
		   clear 
		   ;;

		3) clear
		
		   FUNCAOINFOR

		   echo ""
		   watch -n1 netstat -i
		   ;;

		4) clear
		   
		   FUNCAOINFOR

		   echo "Qual a porta?"
		   echo

		   read PORTA

		   clear
		   
		   FUNCAOINFOR

		   lsof -i :$PORTA
		   read

		
		   ;;

		5) clear
		   
		   FUNCAOINFOR

		   watch netstat --inet -tunp
		   ;;

		6) clear
		   
		   FUNCAOINFOR

		   watch netstat --inet -ntupl
		   ;;

		7) clear
		   
		   echo "1 - De uma rede"
		   echo "2 - De um host específico"
		   echo "3 - De sua interface e de uma porta específica"
		   echo "4 - De outro host e de uma porta específica"
		   echo "5 - Verificar portas abertas"
		   echo "6 - Todos os hosts da rede específicada"
		   echo

		   read RESPOSTA

		   if [ $RESPOSTA = "1" ]; then
		   	
		   	 clear
		   	 
		   	 FUNCAOINFOR

		   	 read -p "Digite a Rede que deseja analisar (DIGITE O IP E MÁSCARA, EX: 192.168.0.0/24): " REDESCAN
		   	 tcpdump -n net $REDESCAN

		   	elif [ $RESPOSTA = "2" ]; then

		   		clear
		   		
		   		FUNCAOINFOR

		   		read -p "Digite o host que deseja analisar (DIGITE SOMENTE O IP, EX: 192.168.0.1): " HOSTSCAN
		   		tcpdump -n host $HOSTSCAN
		   		clear

		   	elif [ $RESPOSTA = "3" ]; then

		   		clear
		   		
		   		FUNCAOINFOR

		   		read -p "Digite a porta que deseja analisar (DIGITE SOMENTE O NÚMERO, EX: 22: " PORTSCAN
		   		tcpdump -n port $PORTSCAN

		   		clear
		   	
		   	elif [ $RESPOSTA = "4" ]; then

		   		clear
		   		
		   		FUNCAOINFOR

		   		read -p "Digite o host que deseja analisar: " HOST1
		   		read -p "Digite a porta de $HOST1 que deseja analisar (DIGITE SOMENTE O NÚMERO, EX: 22: " PORTAHSCAN
		   		tcpdump -n host $HOST1 and port $PORTAHSCAN
		   	
		   		clear

		   	elif [ $RESPOSTA = "5" ]; then

		   		clear
		   		
		   		FUNCAOINFOR

		   		read -p "Digite o IP do host que deseja verificar, EX: 192.168.0.1: " PORTASABERTAS
		   		nmap -sV $PORTASABERTAS -O

		   		read

		   		clear
		   		

		   	elif [ $RESPOSTA = "6" ];then

		   		clear
		   		
		   		FUNCAOINFOR

		   		read -p "Digite o IP e Máscara da rede que deseja analisar ou IP de um HOST específico (Ex: 192.168.0.0/24 ou 192.168.0.6): " HOSTSNAREDE
		   		nmap -sS -O $HOSTSNAREDE

		   		read

		   		clear

		   	fi
			;;

			8) clear
		   	   
			   FUNCAOINFOR

		   	   read -p "Informe o nome da interface: " IWINTERFACE
		   	   echo "Status da interface:" 

		   	   echo
		   	   echo

		   	   iw dev $IWINTERFACE link
		   	   
		   	   echo
		   	   echo "====================================================================================================="
		   	   echo

		   	   sleep 3

		   	   echo "Redes Disponíveis:"
		   	   
		   	   echo
		   	   echo

		   	   nmcli d wifi list 

		   	   echo
		   	   echo



		   	   echo
		   	   echo "====================================================================================================="
		   	   echo

		   	   echo "Conexões salvas"

		   	   echo
		   	   echo

		   	   nmcli c
  			   
  			   echo
		   	   echo "====================================================================================================="
		   	   echo

			   echo "deseja ver mais informações?(S/n)"
		   	   echo
		   	   read RW

		   	   if [ $RW = S ]; 
		   	   then
		   	   		echo
		   	   		echo "====================================================================================================="
		   	   		echo
		   	   		

		   	   		FUNCAOINFOR

		   	   		echo
		   	   		echo

		   	   		clear
		   	   		echo "1 - Login e senha"
		   	   		echo "2 - Informações detalhadas de cada rede no alcance"
		   	   		
		   	   		read OPWIFI

		   	   		echo

		   	   		case $OPWIFI in

		   	   			1) 
							
							clear
							grep -e "ssid=*" --color=always -e "psk=" /etc/NetworkManager/system-connections/* | cut -d: -f2
							read
						 	;;

						2)	
							clear
							iwlist wlp2s0 scanning | grep -A11 Cell
		   	  	   	  		read
		   	  				;;	
		   
		   	  			esac

		   	  		else 
		   	  			
		   	  			
		   	  			exit

		   	  fi
		   	   #iw dev $IWINTERFACE scan
			;;





	esac

	#OUTPUT 2ª CASE
;;



2) clear

FUNCAOINFOR1

echo
echo
echo
echo
echo

echo " 1 - MEMÓRIA"
echo " 2 - CPU"
echo " 3 - PROCESSOS"
echo

read OP4

case $OP4 in

	1) clear
	
		watch -n1 free -h
		;;

	2) clear

		watch sar -uh 1 1
		;;

	3) clear
		
		htop
		;;

	*) clear

	echo "Opcão inválida!"
	echo 
	sleep 3

	clear
	;;


	esac

 ;;

	*) clear

	echo "Opcão inválida!"
	echo 
	sleep 3

	clear
	;;

esac
#OUTPUT 1ª CASE



# else do if da condição do root
else 

	
	echo "================ Somente usuário ROOT pode executar rede.sh ================"
	
	echo
	echo

	echo "Pressione CTRL + C para SAIR"
	sleep 5
	clear

# final da condição do root
fi












done

