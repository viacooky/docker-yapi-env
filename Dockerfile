FROM node:9-alpine


WORKDIR /yapi


RUN npm install -g yapi-cli --registry=https://registry.npm.taobao.org 

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
