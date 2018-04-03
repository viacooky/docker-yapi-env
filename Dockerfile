FROM node:9-alpine

ENV NPM_CONFIG_PREFIX=~/.npm-global

USER node

RUN mkdir ~/.npm-global \
    && mkdir ~/yapi \
    && npm install -g yapi-cli --registry=https://registry.npm.taobao.org 
    

WORKDIR ~/yapi

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
