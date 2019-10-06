#!/usr/bin/env bash

#cores
azul="\033[36;1m"
vermelho="\033[31;1m"
verde="\033[34;1m"
fim="\033[m"

#Testando se o xclip esta presente no sistema
which xclip >> saida.txt \
&& echo -e "$verde Dependencias $azul OK!$fim" || $(echo "$vermelho Dependencia xclip não encontrada!$fim" && exit;)
rm saida.txt
#=======================================================>
read -p "Digite o diretorio onde se encontra o fonte: " dir
cd $dir

read -p "Digite o nome do fonte: " fonte

cat $fonte | netcat termbin.com 9999 >> fonte.txt
xclip -selection "clipboard" fonte.txt \
&& echo -e "$azul O link para seu codigo fonte ja se encontra no clipboard, basta colar aonde quiser!$fim"
