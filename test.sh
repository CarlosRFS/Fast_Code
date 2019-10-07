#!/usr/bin/env bash

#cores
azul="\033[36;1m"
vermelho="\033[31;1m"
verde="\033[34;1m"
fim="\033[m"

#função 
function link_clipboard(){
	cat $fonte | netcat termbin.com 9999 >> link.txt
	xclip -selection "clipboard" link.txt
}


#verificar os parametros posicionais
if [[ $1 ]]; then
	if [[ $2 ]]; then
		a=$3-$2
		head -$3 $1 | tail -$a >> fonte.txt
		fonte="fonte.txt"
	else
		fonte=$1
	fi
	link_clipboard()
else
	echo -e "Digite o caminho para o arquivo do codigo fonte!"
	read fonte
	link_clipboard()
fi
