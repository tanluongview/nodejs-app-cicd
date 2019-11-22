FROM node:10-stretch as builder

ARG ENV_PREFIX

WORKDIR /app
COPY . /app

RUN npm install
EXPOSE 80
CMD npm start