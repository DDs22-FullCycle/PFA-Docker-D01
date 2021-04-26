# build node 
docker build .
docker build --file=$(pwd)/nginx/DockerFile.nginx ./nginx 
docker build --file=$(pwd)/mysql/DockerFile.mysql ./mysql 