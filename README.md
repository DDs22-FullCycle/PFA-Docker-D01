# PFA-Docker-D01
Programa Full Cycle de Aceleração. Desafio Docker 01


## Desafio 1

Crie um programa utilizando sua linguagem de programação favorita que faça uma listagem simples do nome de alguns módulos do curso Full Cycle os trazendo de um banco de dados MySQL. Gere a imagem desse container e a publique no DockerHub.

Gere uma imagem do nginx que seja capaz que receber as solicitações http e encaminhá-las para o container.

Crie um repositório no github com todo o fonte do programa e das imagens geradas.

Crie um arquivo README.md especificando quais comandos precisamos executar para que a aplicação funcione recebendo as solicitações na porta 8080 de nosso computador. Lembrando que NÃO utilizaremos Docker-compose nesse desafio.

### Comandos

#### Opção 1
chmod -R 700 $(pwd)/*.sh
bash Containers_build.sh
bash Containers_start.sh

---
#### Opção 2
docker build .
docker build --file=$(pwd)/nginx/DockerFile.nginx ./nginx 
docker build --file=$(pwd)/mysql/DockerFile.mysql ./mysql 

docker run --rm --name=node-container   --network pfa -p 3300:3300 -it node:15 
docker run --rm --name=nginx-container  --network pfa -p 80:80 -it nginx:alpine 
docker run --rm --name=mysql-container  --network pfa -it nginx:alpine 

---
#### opção para Teste
Caso queira rodar um container ubuntu na rede para testes internos
chmod -R 555 $(pwd)/*.sh
bash Containers_test.sh