FROM node:15.14.0-alpine3.10
RUN apk add bash

WORKDIR /usr/src/
COPY package*.json ./

RUN npm install

EXPOSE 3000

COPY /app /app

#CMD [ "node", "app/index.js" ]
CMD [ "npm", "start" ]