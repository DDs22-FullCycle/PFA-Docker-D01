FROM node:15.14.0-alpine3.10
RUN apk add bash

WORKDIR /usr/src/
COPY package*.json ./

RUN apk add wget

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN npm install
RUN npm install nodemon -g
RUN npm install prisma
RUN npm install @prisma/client

EXPOSE 3000

#COPY /app /app

#dockerize -wait tcp://db:3306 -timeout 20s docker-entrypoint.sh
ENTRYPOINT [ "dockerize", "-wait", "tcp://mysql-container:3306", "-timeout", "20s" ]
CMD [ "npm", "start" ]
#CMD [ "node", "app/index.js" ]
