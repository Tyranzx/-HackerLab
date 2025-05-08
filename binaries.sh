#!/bin/bash

function getTarget(){
        cat ~/.config/bin/target.txt
}

function getInternet(){
	echo -e "%{F#b380ff} %{F#ffffff}$(/usr/sbin/ifconfig ens33 | grep "inet " | awk '{print $2}')"
}

function getVPN(){

VPN0=$(/usr/sbin/ifconfig | grep tun3 | awk '{print $1}' | tr -d ':')

if [ "$VPN0" = "tun3" ]; then
        echo "%{F#00FF78} $(/usr/sbin/ifconfig tun3 | grep "inet " | awk '{print $2}')"
else
	echo "%{F#ff4d4d} Desconectado"
fi

}

function targeto(){
	echo -e "%{F#ff4d4d}󰓾 %{F#ffffff}$(getTarget)"
}

($1)
