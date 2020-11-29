while :; 
 
 

do


clear
# Script de backup


######################################################### Variáveis
DATA=$(date +%Y%m%d)
HORA=$(date +%H:%M)
DATA2=$(date +%d/%m/%Y)

######################################################### FUNÇÕES

function INFO {
clear

echo -e "Data: $DATA2"
echo -e "Hora: $HORA"
} 

INFO

echo " 
 _       _            
| |__   | | __  _ __  
| '_ \  | |/ / | '_ \ 
| |_) | |   <  | |_) |
|_.__/  |_|\_\ | .__/ 
               |_|    
               "

echo "Selecione uma das opções abaixo: "

echo
echo

echo "1) /home (`du -sh /home | awk '{print $1}'`)"
echo "2) /etc (`du -sh /etc | awk '{print $1}'`)"
echo "3) /var (`du -sh /var | awk '{print $1}'`)"
echo "4) /usr (`du -sh /usr | awk '{print $1}'`)"
echo "5) Escolha o diretório que deseja backupear "

echo
echo

echo "Para sair pressione CTRL + C"

echo

read OP

clear

echo "Informe o caminha absoluto do local em que deseja"
echo "salvar o arquivo (Ex: /opt/backups): "

echo 

read DIR_DEST


# INÍCIO DO CASE OP

case $OP in ##### >>>1 

	#/home

	1)
	
	
	clear
	echo "Conteúdo do /home:"
	echo
	echo "`du -sh /home/*`"
	echo
	echo "Selecione o compactador: "
	
	echo 
	
	echo "1 - gz"
	echo "2 - bzip2"
	echo "3 - xz"	
	
	echo

	read OP_COMP

		# INÍCIO DO CASE OP_COMP
		case $OP_COMP in

	
			1)
			
			clear

			tar -zcvf $DIR_DEST/bkp_$DATA.gz /home

			echo
			echo
			
			echo "Backup Realizado!"
			sleep 3
			echo
			echo

			echo "Verifique o $DIR_DEST/bkp_$DATA.gz"
			sleep 7
			clear
			;;


			2)

			clear

			tar -jcvf $DIR_DEST/bkp_$DATA.bzip2 /home

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo

			echo "Verifique o $DIR_DEST/bkp_$DATA.bzip2"
			sleep 7
			clear
			;;

		
			3)

			
			clear

			tar -Jcvf $DIR_DEST/bkp_$DATA.xz /home

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo

			echo "Verifique o $DIR_DEST/bkp_$DATA.xz"
			sleep 7
			clear
			;;

		
		esac

	;;


	








	#/etc

	2)
	
	clear
	echo "Conteúdo do /etc:"
	echo
	echo "`du -sh /etc/*`"
	echo
	echo "Selecione o compactador: "
	
	echo 
	
	echo "1 - gz"
	echo "2 - bzip2"
	echo "3 - xz"	
	
	echo

	read OP_COMP

			# INÍCIO DO CASE OP_COMP
				case $OP_COMP in

			1)
			
			clear

			tar -zcvf $DIR_DEST/bkp_$DATA.gz /etc

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo

			echo "Verifique o $DIR_DEST/bkp_$DATA.gz"
			sleep 7
			clear
			;;


			2)
			
			clear

			tar -jcvf $DIR_DEST/bkp_$DATA.bzip2 /etc

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo
			
			echo "Verifique o $DIR_DEST/bkp_$DATA.bzip2"
			sleep 7
			clear
			;;

		
			3)

		   	clear

			tar -Jcvf $DIR_DEST/bkp_$DATA.xz /etc

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo

			echo "Verifique o $DIR_DEST/bkp_$DATA.xz"
			sleep 7
			clear
			;;
	
			esac

	;;


	











	#/var

	3)

	clear
	echo "Conteúdo do /var:"
	echo
	echo "`du -sh /var/*`"
	echo	
	echo "Selecione o compactador: "
	
	echo 
	
	echo "1 - gz"
	echo "2 - bzip2"
	echo "3 - xz"	
	
	echo

	read OP_COMP

	# INÍCIO DO CASE OP_COMP
	case $OP_COMP in

		1)

		clear

		tar -zcvf $DIR_DEST/bkp_$DATA.gz /var

		echo
		echo
		
		echo "Backup Realizado!"
		sleep 3
		echo
		echo
		
		echo "Verifique o $DIR_DEST/bkp_$DATA.gz"
		sleep 7
		clear
		;;


		2)

		clear
		
		tar -jcvf $DIR_DEST/bkp_$DATA.bzip2 /var

		echo
		echo

		echo "Backup Realizado!"
		sleep 3
		echo
		echo

		echo "Verifique o $DIR_DEST/bkp_$DATA.bzip2"
		sleep 7
		clear
		;;

		
		3)

		clear
		
		tar -Jcvf $DIR_DEST/bkp_$DATA.xz /var

		echo
		echo

		echo "Backup Realizado!"
		sleep 3
		echo
		echo

		echo "Verifique o $DIR_DEST/bkp_$DATA.xz"
		sleep 7
		clear
		;;

	esac

	;;


	










	#/usr

	4)
	
	clear
	echo "Conteúdo do /usr:"
	echo
	echo "`du -sh /usr/*`"
	echo
	echo "Selecione o compactador: "
	
	echo 
	
	echo "1 - gz"
	echo "2 - bzip2"
	echo "3 - xz"	
	
	echo

	read OP_COMP

	# INÍCIO DO CASE OP_COMP
	case $OP_COMP in

		1)

		clear
		
		tar -zcvf $DIR_DEST/bkp_$DATA.gz /usr

		echo
		echo

		echo "Backup Realizado!"
		sleep 3
		echo
		echo

		echo "Verifique o $DIR_DEST/bkp_$DATA.gz"
		sleep 7
		clear
		;;


		2)

		clear
		
		tar -jcvf $DIR_DEST/bkp_$DATA.bzip2 /usr

		echo
		echo

		echo "Backup Realizado!"
		sleep 3

		echo
		echo
		
		echo "Verifique o $DIR_DEST/bkp_$DATA.bzip2"
		sleep 7
		clear
		;;

		
		3)

		clear
		
		tar -Jcvf $DIR_DEST/bkp_$DATA.xz /usr

		echo
		echo

		echo "Backup Realizado!"
		sleep 3
		echo
		echo

		echo "Verifique o $DIR_DEST/bkp_$DATA.xz"
		sleep 7
		clear
		;;

	esac

	;;


	5) 

	clear

	echo "Qual diretório deseja fazer o backup?"
	echo
	echo "Informe o caminho absoluto (Ex: /home/nasser)"

	read CAMINHO_DIR

	clear

	echo "Selecione o compactador: "
	echo "Conteúdo do $CAMINHO_DIR:"
	echo
	echo "`du -sh $CAMINHO_DIR/*`"
	echo
	echo 
	
	echo "1 - gz"
	echo "2 - bzip2"
	echo "3 - xz"	
	
	echo

	read OP_COMP

			# INÍCIO DO CASE OP_COMP
				case $OP_COMP in

			1)

			clear

			tar -zcvf $DIR_DEST/bkp_$DATA.gz $CAMINHO_DIR

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo

			echo "Verifique o $DIR_DEST/bkp_$DATA.gz"
			sleep 7
			clear
			;;


			2)

			clear
		
			tar -jcvf $DIR_DEST/bkp_$DATA.bzip2 $CAMINHO_DIR

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo
			
			echo "Verifique o $DIR_DEST/bkp_$DATA.bzip2"
			sleep 7
			clear
			;;

		
			3)

		   	clear	

			tar -Jcvf $DIR_DEST/bkp_$DATA.xz $CAMINHO_DIR

			echo
			echo

			echo "Backup Realizado!"
			sleep 3
			echo
			echo

			echo "Verifique o $DIR_DEST/bkp_$DATA.xz"
			sleep 7
			clear
			;;
	
			esac

	;;



	


esac 










done
