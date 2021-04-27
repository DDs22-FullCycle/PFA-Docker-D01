echo "Aguarde iniciando o servidor..."

docker run --rm --name=php-container   --network pfa -p 9000:9000 -dit dds22/laravel 
docker run --rm --name=nginx-container  --network pfa -p 80:80 -dit dds22/nginx 
#docker run --rm --name=mysql-container  --network pfa -p 3306:3306 -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit mysql:5.7

docker ps
