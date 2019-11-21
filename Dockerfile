FROM node:10-stretch as builder

ARG ENV_PREFIX

WORKDIR /app
COPY . /app

ENV NODE_ENV=production

RUN npm install
CMD npm start