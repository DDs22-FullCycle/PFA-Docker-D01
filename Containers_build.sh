#!/usr/bin/env bash

case "${1}" in

    prod)
        # PRODUCAO
        echo "Aguarde build em PRODUÇÃO..."
        docker build --force-rm --label=fcpfa --tag=dds22/public:nginx-pfa01 ./nginx 
        docker build --force-rm --label=fcpfa --tag=dds22/public:node-pfa01 --file=node/Dockerfile.prod ./node
        docker build --force-rm --label=fcpfa --tag=dds22/public:mysql-pfa01 ./mysql 
    ;;

    dev|*)
        # DEV
        echo "Aguarde build em DEV..."
        docker build --force-rm --label=fcpfa --tag=dds22/public:nginx-pfa01 ./nginx 
        #docker build --force-rm --no-cache --label=fcpfa --tag=dds22/public:laravel-pfa01 ./laravel 
        docker build --force-rm --label=fcpfa --tag=dds22/public:node-pfa01 ./node 
        docker build --force-rm --label=fcpfa --tag=dds22/public:mysql-pfa01 ./mysql 
    ;;
    
    

esac



