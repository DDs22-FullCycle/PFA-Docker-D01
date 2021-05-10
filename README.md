# PFA-Docker-D01
Programa Full Cycle de Aceleração. Desafio Docker 01

## Sobre o Desafio ( PFA 01 )

- Crie um programa utilizando sua linguagem de programação favorita que faça uma listagem simples do nome de alguns módulos do curso Full Cycle os trazendo de um banco de dados MySQL. Gere a imagem desse container e a publique no DockerHub.
- Gere uma imagem do nginx que seja capaz que receber as solicitações http e encaminhá-las para o container.
- Crie um repositório no github com todo o fonte do programa e das imagens geradas.
- Crie um arquivo README.md especificando quais comandos precisamos executar para que a aplicação funcione recebendo as solicitações na porta 8080 de nosso computador. Lembrando que NÃO utilizaremos Docker-compose nesse desafio.

---
## Comentários 
Este desafio teve como objetivo criar um projeto básico de comunicação entre uma aplicação node.js e um banco de dados Mysql, usando o nginx como controlador das requisições http da nossa aplicação.
Todo o projeto visa em usar apenas as linhas de comando do docker para preparar as imagens e subí-las, do mesmo modo que também seja possível executar a nossa aplicação.
OBS: Foi configurado pensado para um ambiente de desenvolvimento, o que deixa as imagens mais pesadas e com configurações fixas.

---
# Extras 
- Prisma 2 (ORM)
Foi adicionado e configirado no projeto um ORM que se chama prisma, usei ele para fazer a comunicação com o Banco de dados, carregar os dados iniciais da aplicação (seed), entre outros e por esse motivo não foi adicionado o comando para criar um volume e fazer a persistência dos dados ("-v $(pwd)/db/mysql:/var/lib/mysql").
Segundo a ferrenta, o prisma "é um novo tipo de ORM que difere fundamentalmente dos ORMs tradicionais e não sofre de muitos dos problemas comumente associados a eles".
- TypeScript
Usado com o principal objetivo de aplicar uma tipagem estática ao javascript.
- Arquivos .sh
Adicionado os arquivos que criei, onde facilitou um pouco neste processo de desafio.

---
### Comandos
#### Crie a rede para executar os containers
```bash
docker network create pfa 
```
#### Rode o container com a imagem mysql
```bash
docker run --rm --name=mysql-container --network pfa -p 3306:3306 -e MYSQL_DATABASE=modulos -e MYSQL_ROOT_PASSWORD=root -dit dds22/public:mysql-pfa01 
```
#### Rode o container com a imagem do node.js
```bash
docker run --rm --name=node-container --network pfa -p 3000:3000 -dit dds22/public:node-pfa01 
```
#### Rode o container com a imagem do nginx
```bash
docker run --rm --name=nginx-container --network pfa -p 8080:8080 -dit dds22/public:nginx-pfa01 
```
#### Rode a url no navegador
```
http://localhost:8080
```

