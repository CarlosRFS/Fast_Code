
#Este script tem o intuito de auxiliar no envio de codigo ao Termbin e ja colocando o link para ele 
#no clipboard. De forma que evite o uso desnecessario do mouse para selecionar copiar o link que é 
#exibido no terminal, uma vez que programadores enviam codigo com certa frequência uns para os outros
#e sites como termbin são muito utilizados para que codigo não polua as conversas nos grupos e ainda
#assim todos tenham acesso rapido a ele.

:::::Enviando o codigo fonte inteiro
#Executando o script normalmente ele pedira o caminho do fonte, se estiver na mesma pasta em que esta
#basta passar o nome do arquivo.
#Você pode tambem passar o nome do arquivo como primeiro parametro do programa como no exemplo abaixo

==> ./fast_code.sh exe.cpp
#======================================

:::::Enviando trechos de codigos
#Tambem é possivel enviar apenas trechos do codigo especificando quais linhas enviar da seguinte 
#forma
==> ./fast_code.sh exe.cpp 4 16
#O primeiro parametro se trata do nome do arquivo, que pode tambem ser passado ao longo da execução
#O segundo parametro se trata do numero da primeira linha do arquivo que sera copiada
#Enquanto que o terceiro se trata da ultima linha a ser copiada


