FROM node:9-alpine

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

USER node

RUN mkdir ~/.npm-global \
    && mkdir ~/my-yapi \
    && npm install -g yapi-cli --registry=https://registry.npm.taobao.org 
    

WORKDIR /my-yapi

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
