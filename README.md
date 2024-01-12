# Estudando Shell Scripting através da Alura

### conversao-jpg-png.sh:
- Para rodar os scripts, o interpretador no terminal é o bash, então: ``bash <nome do shellscript>``
- "$@" engloba todos os parâmetros em um laço for por exemplo: ``for image in $@``
- "$1" ou "$2": um parâmetro ou dois a serem recebidos.
- No loop for do 'conversao-jpg-png.sh' é ``$imagem in $@`` para não limitar a quantidade de arquivos.
- Num cenário de execução automática do sh fica ``for imagem in *.jpg`` 
- Em ``ls algoritmos.jpg | awk -F.`` o awk dividirá o nome do arquivo "algoritmos.jpg" em dois campos: "algoritmos" e "jpg". Esses campos podem ser referenciados no awk como $1 e $2, respectivamente.
- Com o if ``if [ ! -d png ] then mkdir png fi`` o script verifica se existe o diretório 'png' e o '!' assegura que, caso não existir, o diretório seja criado com o 'then'
- Em sistemas Unix existem os descritores de arquivos(indicadores de acessos de arquivos e recursos de entrada e saída), então os fluxos padrões de entrada, saída e erro são representados por números:
  **0 = entrada padrão | 1 = saída padrão | 2 = mensagens de erro padrão**
   - **0 (stdin)**: Representa a entrada padrão. Este descritor de arquivo é associado geralmente ao teclado, e os programas podem ler dados da entrada padrão através dele.

   - **1 (stdout)**: Representa a saída padrão. Este descritor de arquivo é associado geralmente à tela, e os programas podem enviar dados para a saída padrão através dele.

   - **2 (stderr)**: Representa a saída de erro padrão. Este descritor de arquivo também é associado geralmente à tela, e os programas podem enviar mensagens de erro ou diagnóstico para a saída de erro padrão através dele.
- 
