#!/usr/bin/env bash

#cores
azul="\033[34;1m"
vermelho="\033[31;1m"
verde="\033[36;1m"
fim="\033[m"

#Testando as dependencias
type "xclip" &>/dev/null \
&& echo -e "$azul Dependencias$verde OK! $fim" \
|| $( echo -e "$vermelho Dependencia xclip não encontrada! $fim" && exit )

#testando se deve ser usado netcat ou ncat
for i in "netcat" "ncat"; do
	type $i &>/dev/null && nt=$i
done
#função 
function link_clipboard(){
	cat $fonte | $nt termbin.com 9999 >> link.txt
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
	link_clipboard
else
	echo -e "$azul Digite o caminho para o arquivo do codigo fonte! $fim"
	read fonte
	link_clipboard
fi
