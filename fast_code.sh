#!/usr/bin/env bash

#OBSERVAÇÔES
#==> Adicionar mensagens de erro para diretorios invalidos e arquivos fonte nao encontrados
#==> Adicionar função de passar como parametro o nome do arquivo se estiver no mesmo diretorio
#==> Possibilidade de selecionar quais linhas do codigo devem ser enviadas
#OPCIONAL==> Exibir o link para baixar o fonte do xclip se ele não estiver disponivel no sistema
#==> Adicionar um menu para utilizar o script mais de uma vez
#==> Adicionar parametro para habilitar/desabilitar o menu

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
cd $dir || $( echo -e "$vermelho Diretorio não encontrado!$fim" && exit; )

read -p "Digite o nome do fonte: " fonte
#testando se o arquivo existe
cat $fonte || $( echo -e "$vermelho Arquivo não encontrado!$fim" && exit; )

cat $fonte | netcat termbin.com 9999 >> fonte.txt
xclip -selection "clipboard" fonte.txt \
&& echo -e "$azul O link para seu codigo fonte ja se encontra no clipboard, basta colar aonde quiser!$fim"
rm fonte.txt
