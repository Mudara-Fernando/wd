FROM node:20.11.1-alpine

#ADD . /app
WORKDIR /app

COPY web/package*.json ./

RUN npm install

CMD ["npm", "start"]