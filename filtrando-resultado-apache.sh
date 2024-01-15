#!/bin/bash

cd ~/apache-log

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"         #\b=word boundary: o parametro passado 
                                                    #tem q/ ser o especifico q/ está na regex(ñ aceita letras, vírgulas)
if [[ $1 =~ $regex ]] 
then
    cat apache.log | grep $1
        if [ $? -ne 0 ]             #'-ne'= not equal
        then
                echo "IP procurado não está presente no arquivo"
        fi
else
    echo "Formato não é válido"
fi
