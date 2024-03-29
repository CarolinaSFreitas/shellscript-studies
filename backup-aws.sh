#!/bin/bash

CAMINHO_BACKUP=/home/carol/backup_mutillidae_aws
cd $CAMINHO_BACKUP
data=$(date +%F)

if [ ! -d $data ]
then
    mkdir $data
fi


tabelas=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
    mysqldump -u root mutillidae $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

aws s3 sync $CAMINHO_BACKUP s3://curso-shell-script     #através do protocolo s3, enviará infos locais do bd p/ aws
