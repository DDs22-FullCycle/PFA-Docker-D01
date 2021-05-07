#!/usr/bin/env bash

echo "Aguarde iniciando o servidor..."

#docker run --rm --name=php-container --network pfa -p 9000:9000 -v $(pwd)/laravel/src:/var/www -dit dds22/laravel
 
docker run --rm --name=node-container --network pfa -p 3000:3000 -v "$(pwd)/node:/usr/src" -dit dds22/node 

docker run --rm --name=nginx-container --network pfa -p 8080:8080 -dit dds22/nginx 

#docker run --rm --name=mysql-container --network pfa -p 3306:3306 -v $(pwd)/db/mysql:/var/lib/mysql -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit dds22/mysql 
docker run --rm --name=mysql-container --network pfa -p 3306:3306 -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit dds22/mysql 

docker ps
