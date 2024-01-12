#!/bin/bash

converte_imagem() {
    cd ~/Downloads/imagens-livros/

    if [ ! -d png ] then
        mkdir png
    fi

    for imagem in *.jpg do
        local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }') #o local significa que a variável só
        convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png        #pode ser acessada dentro do escopo
    done

}

converte_imagem 2>erros_conversao.txt #2 é o nº q/ representa msgs de erro padrão e o '>'' envia p/ txt
if [ $? -eq 0 ] then                 #o $? verifica o status de saída da função converte_imagem (0 = td certo)
    echo "Conversão realizada com sucesso! :)"
else
    echo "Houve uma falha na conversão :("
fi
