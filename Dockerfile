FROM node:10-stretch as builder

ARG ENV_PREFIX

WORKDIR /app
COPY . /app

ENV NODE_ENV=production
ENV PORT=3030

RUN npm install
EXPOSE ${PORT}
CMD npm start