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

### filtro-requisicao.sh
- ``-eq`` (equal) compara valores inteiros
- Na estrutura ``case`` a verificação é feita pelo tipo de dado e o terminador(``;;``) vai nessa verificação. Ex. de valor do parâmetro: ``GET), POST), PUT), DELETE)``. O ``*)`` é como um else, qualquer outro parâmetro fora dos especificados na estrutura entram nesse.

### monitora-servidor-apache.sh
- o ``curl`` pode verificar o conteúdo da página do localhost com o Apache e trazer o status HTTP para fazer a verificação do servidor
- O /dev/null é um arquivo especial que tem como objetivo descartar toda a informação de entrada. O arquivo null seria um arquivo especial do sistema que tem como objetivo descartar as informações que são repassadas a ele(ex.:``cat testando.txt 2> /dev/null``, que vai    descartar as mensagens de erro do comando ``cat``
- O pacote "ssmtp" é um agente de transferência de correio simples (Simple Mail Transfer Protocol) no Linux, então ele enviará um e-mail do status do servidor HTTP da máquina p/ o e-mail do administrador do servidor(ou qqr outra opção desejada) - pode ser mais recomendável considerar alternativas mais modernas e seguras, como 'msmtp', 'postfix' ou 'sendmail'.
  - Ao editar o arquivo de configuração do ssmtp (/etc/ssmtp/ssmtp.conf), será definido o e-mail agente que irá enviar os e-mails para o administrador
    
    <img width="409" alt="image" src="https://github.com/CarolinaSFreitas/shellscript-studies/assets/99994934/2c2a52c1-b6ce-422f-a6ef-9f005be2102c">

    ``
    root=[seu e-mail]
    mailhub=smtp.gmail.com:587
    AuthUser=[seu e-mail]
    AuthPass=[sua senha]
    UseSTARTTLS=yes
    ``
    
- O pacote "mailutils" irá ajudar a de fato **enviar** o status do Apache por e-mail através do script
  
  ``mail -s "Problema no Servidor" adm.mutillidae@gmail.com<<del
    Houve um problema no servidor e os usuários pararam de ter acesso ao conteúdo web.
    del
  ``
  
  Esse trecho do script define a mensagem do e-mail, o subject e para quem será enviado. o ``<<del ..... del`` é o delimitador da mensagem do e-mail em si.
  **Lembrando que toda essa verificação do status do servidor (e etc) através da execução do shellscript está sendo feita pelo crontab**

### verifica-memoria-consumida.sh
- ``-gt``: greater than

### backup.aws.sh
- A opção '-v' no exemplo ``cat testando.txt | grep -v tabelas`` faz uma "busca invertida", ou seja, serão buscadas todas as linhas com exceção da linha com o nome passado como argumento para o grep, dessa forma teremos a impressão das linhas com os nomes 'produtos, resultado, banco' mesmo se no arquivo testando.txt nós tivermos as palavras 'tabelas, produtos, resultado e banco' cada uma em uma linha.
- Esse script + o crontab fará com que o backup do banco de dados seja enviado para o S3 automaticamente com o  nome do arquivo sendo a data e o conteúdo as tabelas de backup

### restore-aws-s3.sh
- Esse sh trará as informações do bucket S3 definidas no parâmetro do usuário
- ``bash restore-aws-s3.sh <nome-tabela-db-p-restauro>`` faz o restore da tabela que está no S3 para o banco de dados 

----------------------

- `` chmod +x <arquivo>.sh ``
- `` ./<arquivo>.sh ``
