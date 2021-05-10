#!/usr/bin/env bash

case "${1}" in

    push)
        echo "[=>   ] nginx ..."
        docker push dds22/public:nginx-pfa01 
        echo "[==>  ] mysql ..."
        docker push dds22/public:mysql-pfa01  
        echo "[===> ] node ..."
        docker push dds22/public:node-pfa01 
        echo "[#####] Concluído." 
        # docker push dds22/public:laravel-pfa01 
        # Comandos    
    ;;
    
    pull)
        echo "[=>   ] nginx ..."
        docker pull dds22/public:nginx-pfa01 
        echo "[==>  ] mysql ..."
        docker pull dds22/public:mysql-pfa01  
        echo "[===> ] node ..."
        docker pull dds22/public:node-pfa01 
        echo "[#####] Concluído." 
        # docker push dds22/public:laravel-pfa01 
        # Comandos    
    ;;

    run)
        echo "[=>   ] criando a rede pfa..."
        docker network create pfa 
        echo "[==>  ] mysql ..."
        docker run --rm --name=mysql-container --network pfa -p 3306:3306 -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit dds22/public:mysql-pfa01 
        echo "[===> ] node ..."
        docker run --rm --name=node-container --network pfa -p 3000:3000 -dit dds22/public:node-pfa01 
        echo "[====>] nginx ..."
        docker run --rm --name=nginx-container --network pfa -p 8080:8080 -dit dds22/public:nginx-pfa01 
        echo "[#####] Concluído." 
        # docker push dds22/public:laravel-pfa01 
        # Comandos    
    ;;

    *)
        echo "[=>   ] nginx ..."
        docker push dds22/public:nginx-pfa01 
        echo "[==>  ] mysql ..."
        docker push dds22/public:mysql-pfa01  
        echo "[===> ] node ..."
        docker push dds22/public:node-pfa01 
        echo "[#####] Concluído." 
        # docker push dds22/public:laravel-pfa01 
        # Comandos    
    ;;
esac

