# Estudando Shell Scripting através da Alura

- Para rodar os scripts, o interpretador no terminal é o bash, então: ``bash <nome do shellscript>``
- "$@" engloba todos os parâmetros em um laço for por exemplo: ``for image in $@``
- "$1" ou "$2": um parâmetro ou dois a serem recebidos.
- No loop for do 'conversao-jpg-png.sh' é ``$imagem in $@`` para não limitar a quantidade de arquivos.
- Num cenário de execução automática do sh fica ``for imagem in *.jpg`` 
- Em ``ls algoritmos.jpg | awk -F.`` o awk dividirá o nome do arquivo "algoritmos.jpg" em dois campos: "algoritmos" e "jpg". Esses campos podem ser referenciados no awk como $1 e $2, respectivamente.
- 
