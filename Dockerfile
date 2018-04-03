FROM node:9-alpine


WORKDIR /home/yapi

USER node

RUN npm install -g yapi-cli --registry=https://registry.npm.taobao.org 

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
