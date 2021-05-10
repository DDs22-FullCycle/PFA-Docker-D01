#!/usr/bin/env bash

case "${1}" in

    prod)
        echo "Aguarde iniciando o servidor PRODUÇÃO..."
        docker run --rm --name=mysql-container --network pfa -p 3306:3306 -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit dds22/public:mysql-pfa01 
        docker run --rm --name=node-container --network pfa -p 3000:3000 -dit dds22/public:node-pfa01 
        docker run --rm --name=nginx-container --network pfa -p 8080:8080 -dit dds22/public:nginx-pfa01
        docker ps 
    ;;

    mysq)
        echo "Aguarde iniciando o servidor MYSQL DEV..."
        docker run --rm --name=mysql-container --network pfa -p 3306:3306 -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit dds22/public:mysql-pfa01 
    ;;
    
    node)
        echo "Aguarde iniciando o servidor NODE DEV..."
        if [[ "${2}" == "bash" ]]; then
            docker run --rm --name=node-container --network pfa -p 3000:3000 -v "$(pwd)/node/app:/usr/src" -it dds22/public:node-pfa01 bash
        else
            docker run --rm --name=node-container --network pfa -p 3000:3000 -v "$(pwd)/node/app:/usr/src" -dit dds22/public:node-pfa01 
        fi
    ;;

    nginx)
        echo "Aguarde iniciando o servidor NGINX DEV..."
        docker run --rm --name=nginx-container --network pfa -p 8080:8080 -dit dds22/public:nginx-pfa01 
    ;;

    dev|*)
        echo "Aguarde iniciando o servidor DEV..."
        docker run --rm --name=mysql-container --network pfa -p 3306:3306 -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit dds22/public:mysql-pfa01 
        docker run --rm --name=node-container --network pfa -p 3000:3000 -v "$(pwd)/node/app:/usr/src" -dit dds22/public:node-pfa01 
        docker run --rm --name=nginx-container --network pfa -p 8080:8080 -dit dds22/public:nginx-pfa01 
        docker ps
    ;;
    
    

esac
