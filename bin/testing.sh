#!/bin/bash

# Colors
green="\e[0;32m\033[1m"
white='\033[0;37m'
black='\033[0;30m'
clear='\033[0m'
red="\e[0;31m\033[1m"
purple="\e[0;35m\033[1m"
magenta='\033[0;35m'
cyan='\033[0;36m'
gray="\e[0;37m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"

trap ctrl_c INT

function ctrl_c()
{
    echo -e "${red}\nCerrando script.."; sleep 0.5; exit 0
}
#function helpPanel()
#{
    #echo -e "${red}Contraseña; StellarSquad PIN"
#}
function helpPassword()
{
    echo -e "${red}Contraseña; StellarSquad PIN"
}
function menu()
{
    read -p "Elige una opcion: " x 
    if [ $x = "123" ]; then
        echo -e "${cyan} Con exito"; for i in $(seq 1 10); do echo "Hola testing"; done; exit 0
    else 
        echo -e "${red}Esta opcion no existe."
    fi
}

echo -e "${magenta}"
read -p "Insertar contraseña: " p

if [ $p -ne "7745274" ]; then
    helpPassword
else
    echo -e "${green}Has ingresado con exito.${magenta}"
    menu
fi
