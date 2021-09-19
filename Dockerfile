# pull the Node.js Docker image
FROM node:alpine

ARG PORT=5000
ENV PORT=${PORT}

WORKDIR /usr/src

ENV PATH /usr/src/node_modules/.bin/:$PATH

COPY package*.json ./

RUN yarn && yarn cache clean --force

WORKDIR /usr/src/app

COPY . .

EXPOSE ${PORT}

CMD ["ts-node-dev", "src/server.ts"]