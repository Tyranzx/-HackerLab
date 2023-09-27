#!/bin/bash

# Colors

BRed='\033[1;31m'
green="\e[0;32m\033[1m"
white='\033[0;37m'
clear='\033[0m'
red="\e[0;31m\033[1m"
purple="\e[0;35m\033[1m"
magenta='\033[0;35m'
cyan='\033[0;36m'
yellow="\e[0;33m\033[1m"

# Author: Tyranzx
# us@stellarsquad

other="No"

trap ctrl_c INT

function ctrl_c(){
	echo -e "${red}Cerrando script..";
	sleep 0.5; tput cnorm; exit 0
}

function helpPanel(){
	clear; sleep 0.5;
	clear; echo -e "${magenta}"
	echo -e "┌─┐┌─┐┌┬┐┌┬┐┌─┐┌─┐┬┌─"
	echo -e "└─┐├─┤ │  │ ├─┤│  ├┴┐  ${white}→ by Tyranzx${magenta}"
	echo -e "└─┘┴ ┴ ┴  ┴ ┴ ┴└─┘┴ ┴"
	echo -e "\n${BRed}[*] ${white}Uso correcto: $0 -i [address] -p [port] -x [other_params] ${gray}(Optional)${white}."
	echo -e "\t${green}[${yellow}*${green}]${white} i = IP | p = Port"
	echo -e "\n${yellow}[!] ${white}Otro: \n\t${white}Ejemplo de puertos: \n\t\t${yellow}[${red}*${yellow}] ${white}445\n\t\t${yellow}[${red}*${yellow}] ${white}139"
	echo -e "\t\t${yellow}[${red}*${yellow}] ${white}3306"
	echo -e "\t\t${yellow}[${red}*${yellow}] ${white}53\n\t\t${yellow}[${red}*${yellow}] ${white}22\n\t\t${yellow}[${red}*${yellow}] ${white}2222"
	echo -e "\t\t${yellow}[${red}*${yellow}] ${white}2000-65535 ${purple}[Minecraft]"
	echo -e "\t\t${yellow}[${red}*${yellow}] ${white}25565 ${purple}[Minecraft localhost]"
	echo -e "\n${green}[*] ${white}Ejemplo: $0 -i 127.0.1.1 -p 2000-65535 -x '-v -A -T4'"
	tput cnorm; exit 0
}
function attack(){

	if (( $UID != 1000 )); then
		tput cnorm; echo -e "\n${red}[*] ${white}Debes ejecutar el script como un usuario normal."
		sleep 1; exit 1
	else
		tput civis; clear;
		echo -e "${magenta}"
		echo "┌─┐┌─┐┌─┐┌┐┌┌┐┌┬┌┐┌┌─┐  "
		echo "└─┐│  ├─┤│││││││││││ ┬  "
		echo "└─┘└─┘┴ ┴┘└┘┘└┘┴┘└┘└─┘oo"
		echo -e "\n${white} ◆ ${purple}Objetivo: ${white}${i}"
    	echo -e "${white} ◆ ${purple}Puerto especificado: ${white}${p}"
    	echo -e "${white} ◆ ${purple}Otro especificado: ${white}$other\n${clear}"
		sleep 3
		touch ~/.config/bin/sattack_target; nmap -p ${p} ${i} ${x} -oG ~/.config/bin/sattack_target
    	sleep 1
    	echo -e "\n${green}[*] ${white}Se han escaneado los puertos correctamente. Leyendo resultados de ${yellow}~/.config/bin/sattack_target${white}..${clear}"
    	sleep 2
    	echo -ne "\n${green}▶———————————————————————————————————————————◀${white}\n\n${white}"
    	grep -v ^\# ~/.config/bin/sattack_target | tr '/' ' ' | sed 's/filtered//g'
    	echo -ne "\n${green}▶———————————————————————————————————————————◀\n${clear}";
   		tput cnorm; exit 0
   	fi
}

function dependencies(){

	clear; dependencies=(nmap cmatrix)
		# cmatrix es nada más para mostrar el proceso, puede ser removido xd
	echo -e "\n${yellow}[*] ${white}Comprobando que tengas los paquetes necesarios..${clear}"; sleep 1

	for program in "${dependencies[@]}"; do
		echo -e "\n${yellow}[*] ${white}Comprobando la existencia de $program${clear}"

		test -f /usr/bin/$program
		result=$(echo $?)

		if [ $result = 1 ] || [ $result = 127 ]; then
			if (( $UID != 0 )); then
				echo -e "${red}[*] ${white}Un paquete no está instalado en tu sistema, ejecuta el script como root y vuelve a intentarlo."
				tput cnorm; exit 1
			else
				sleep 2; echo -e "${red}[*] ${white}El paquete ${red}$program ${white}no se encuentra instalado en tu sistema.${clear}"
				sleep 2; echo -e "${green}Instalando paquete ${yellow}$program${green}.."
				apt install $program -y &>/dev/null
				sleep 2; echo -e "\n${green}[*] ${white}Paquete ${green}$program ${white}ha sido instalado correctamente.${clear}"
			fi
		else
			echo -e "${green}[*] ${white}El paquete ${yellow}$program ${white}está instalado en tu sistema.\n${clear}"
			sleep 2;
		fi
	done
	echo -e "\n${purple}Comprobación de paquetes hecha correctamente.\n${clear}"
}

tput civis; declare -i parameter_counter=0
while getopts ":i:p:x:" params; do

		case $params in
			i) i=$OPTARG; let parameter_counter+=1;;

			p) p=$OPTARG; let parameter_counter+=1;;

			x) x=$OPTARG; let parameter_counter+=1;;

			*) helpPanel;;

		esac
	done

if [ -z $i ] || [ -z $p ]; then
	helpPanel
else
	dependencies

	if [ -z $x ]; then
		attack
	else
	    other=$x
		attack
	fi

fi
