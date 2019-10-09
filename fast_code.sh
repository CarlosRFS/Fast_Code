#!/usr/bin/env bash

#AUTOR ==> Carlos Raimundo de Freitas Sotero
#Email ==> carlosrfs99@gmail.com


#OBSERVAÇÔES
#==> Possibilidade de selecionar quais linhas do codigo devem ser enviadas
# talvez usar o grep ou cat e salvar as linhas selecionadas num arquivo temporario
#OPCIONAL==> Exibir o link para baixar o fonte do xclip se ele não estiver disponivel no sistema
#==> Adicionar um menu para utilizar o script mais de uma vez
#==> Adicionar parametro para habilitar/desabilitar o menu

#cores
azul="\033[36;1m"
vermelho="\033[31;1m"
verde="\033[34;1m"
fim="\033[m"

#Testando se o xclip esta presente no sistema
type xclip &>/dev/null && echo -e "$verde Dependencias $azul OK!$fim" || $( echo -e "$vermelho Dependencia xclip não encontrada!$fim" && exit )

#=======================================================>
if [[ $1 == 0 ]]; then
	fonte=$1
else
	read -p "Digite o diretorio onde se encontra o fonte: " dir
	cd $dir || $( echo -e "$vermelho Diretorio não encontrado!$fim" && exit; )
	read -p "Digite o nome do fonte: " fonte
fi

#testando se o arquivo existe
cat $fonte >> /dev/null || $( echo -e "$vermelho Arquivo não encontrado!$fim" && exit; )

cat $fonte | netcat termbin.com 9999 >> fonte.txt
xclip -selection "clipboard" fonte.txt \
&& echo -e "$azul O link para seu codigo fonte ja se encontra no clipboard, basta colar aonde quiser!$fim"
rm fonte.txt
