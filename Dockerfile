FROM node:9-alpine

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

USER node

RUN mkdir ~/.npm-global
RUN mkdir ~/yapi
RUN npm install -g yapi-cli --registry=https://registry.npm.taobao.org 

WORKDIR /home/node/yapi

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
