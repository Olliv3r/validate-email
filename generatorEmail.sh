#!/usr/bin/env bash
# Gerador de e-mails com base no nome de usuário e números entre 0 e total gerado
#

usuario="$1"
server="$2.com"
total="$3"

generator() {
    if [ "${server:9}" == ".com" ] ; then
	server="${server:0:9}"

    fi

    email=${usuario}${1}@${server} #joao50@gmail.com
    echo $email >> ${usuario}.txt
}

main() {
    for ((i = 0; i < total; i++ )) ; do
        printf "\rGerando [$i] e-mails..."
        generator $i
    done
    printf "\rGerando [$i] e-mails...OK\n"
}

if [ -z "$1" -a -z "$2" -a -z "$3" ] ; then
    echo -e "Tente bash $0 <usuario> <server> <total>\nExemplo:\n\tbash $0 joaoerinel gmail 50"
    exit 1

else
    main
fi
