FROM node:10-stretch as builder

ARG ENV_PREFIX

WORKDIR /app
COPY . /app

ENV PORT=3030

RUN npm install
CMD npm start