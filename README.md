# Estudando Shell Scripting através da Alura

### conversao-jpg-png.sh:
- Para rodar os scripts, o interpretador no terminal é o bash, então: ``bash <nome do shellscript>``.
- "$@" engloba todos os parâmetros em um laço for por exemplo: ``for image in $@``.
- "$1" ou "$2": um parâmetro ou dois a serem recebidos.
- No loop for do 'conversao-jpg-png.sh' é ``$imagem in $@`` para não limitar a quantidade de arquivos.
- Num cenário de execução automática do sh fica ``for imagem in *.jpg``.
- Em ``ls algoritmos.jpg | awk -F.`` o awk dividirá o nome do arquivo "algoritmos.jpg" em dois campos: "algoritmos" e "jpg". Esses campos podem ser referenciados no awk como $1 e $2, respectivamente.
- Com o if ``if [ ! -d png ] then mkdir png fi`` o script verifica se existe o diretório 'png' e o '!' assegura que, caso não existir, o diretório seja criado com o 'then'.
- Em sistemas Unix existem os descritores de arquivos(indicadores de acessos de arquivos e recursos de entrada e saída), então os fluxos padrões de entrada, saída e erro são representados por números:
  **0 = entrada padrão | 1 = saída padrão | 2 = mensagens de erro padrão**
   - **0 (stdin)**: Representa a entrada padrão. Este descritor de arquivo é associado geralmente ao teclado, e os programas podem ler dados da entrada padrão através dele.

   - **1 (stdout)**: Representa a saída padrão. Este descritor de arquivo é associado geralmente à tela, e os programas podem enviar dados para a saída padrão através dele.

   - **2 (stderr)**: Representa a saída de erro padrão. Este descritor de arquivo também é associado geralmente à tela, e os programas podem enviar mensagens de erro ou diagnóstico para a saída de erro padrão através dele.

### processos-memoria.sh
- Em `` echo "$(bc <<<"scale=2;$tamanho_processo/1024") MB" >> log/$nome_processo.log `` o 'bc' faz o cálculo da divisão e o 'scale=2;' traz as duas casas decimais do resultado da divisão. 

----------------------------

### filtrando-resultado-apache.sh
-  Comparando parâmetro com regex: ``[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}`` significa que os intervalos do IPv4 buscado no terminal podem ter 3 algarismos de 0 até 9
   - Podemos melhorar a nossa expressão regular. Se repararmos, o trecho [0-9]{1,3}. se repete por 3 vezes. Poderíamos simplesmente agrupar esse valor entre () e colocar um quantificador para dizer que a parte agrupada irá se repetir por 3 vezes:
    ``([0-9]{1,3}.){3}[0-9]{1,3}`` 
    Para nos ajudar nessa verificação, utilizaremos o site regex101.com. Existem outros sites que também conseguem essa validação. Copiaremos a expressão criada, e vamos colar no campo REGULAR EXPRESSION nesse mesmo site. Depois, no campo TEST STRING, colocaremos o   
    endereço IP que havíamos testado: 192.168.1.10.
    O site nos retornou 1 match, significa que o resultado ``([0-9]{1,3}.){3}[0-9]{1,3}`` teve um padrão aceito em nossa expressão regular. Vamos fazer o seguinte. Tentaremos trocar o ponto por uma vírgula. O site nos retorna algo diferente de antes? Não! Continua 
    sendo    exibido 1 match!
   
   Isso acontece porque colocamos o ponto em nossa expressão regular, porém não realizamos o escape dele, dizendo que literalmente a divisão entre esses intervalos precisa ser somente o ponto. Para dizer que somente o ponto é aceito para dividir esses intervalos,      
   colocamos a barra \ antes do ponto, assim nós o "escapamos".
   
   Sempre que fazemos isso, estamos dizendo que a divisão entre os intervalos só pode ser o ponto! ``([0-9]{1,3}\.){3}[0-9]{1,3}``
   Para testar, temos o endereço IP, podendo variar de um a três algarismos. Tentaremos colocar um algarismo a mais do permitido no final, a fim de testá-lo. Então, o endereço IP ficará assim: 192.168.1.1000.
   
   Como podemos ver, esse endereço é compatível com a expressão regular. Ele só é compatível, porque o que está sendo considerado é somente 192.168.1.1000. Mas se o usuário digitar dessa forma no script (com um dígito a mais), o padrão seria aceito, o que não deveria      acontecer. Sendo assim, é interessante colocarmos um delimitador, dizendo que nada no final ou no início pode existir!
   
   O delimitador de palavras é o Word Boundary, simbolizado por \b. Adicionando esse delimitador nas extremidades da expressão, não será reconhecido nenhum algarismo que ultrapasse a quantidade de 3 por intervalo. ``\b([0-9]{1,3}\.){3}[0-9]{1,3}\b``
   Bom, com isso, sabemos que o endereço IP 192.168.1.1000 não será aceito pois ele não está respeitando as regras da expressão.

### 
