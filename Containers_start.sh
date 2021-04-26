echo "Aguarde iniciando o servidor..."

docker run --rm --name=node-container   --network pfa -p 3300:3300 -dit node:15 
docker run --rm --name=nginx-container  --network pfa -p 80:80 -dit nginx:alpine 
docker run --rm --name=mysql-container  --network pfa -dit nginx:alpine 

docker ps
