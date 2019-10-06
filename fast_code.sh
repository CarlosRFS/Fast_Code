#!/usr/bin/env bash


#Testando se o xclip esta presente no sistema
which xclip >> saida.txt \
&& echo "Dependencias OK!" || $(echo "Dependencia xclip não encontrada!" && exit;)

#=======================================================>
read -p "Digite o diretorio onde se encontra o fonte: " dir
cd $dir

read -p "Digite o nome do fonte: " fonte

cat $fonte | netcat termbin.com 9999 >> fonte.txt
xclip -selection "clipboard" fonte.txt \
&& echo "O link para seu codigo fonte ja se encontra no clipboard, basta colar aonde quiser!"
