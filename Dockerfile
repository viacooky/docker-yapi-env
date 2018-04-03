FROM node:9-alpine

RUN cp /etc/apk/repositories /etc/apk/repositories.bak
RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" > /etc/apk/repositories
RUN apk add --no-cache make python git
RUN npm install -g -g yapi-cli --registry=https://registry.npm.taobao.org 

WORKDIR /my-yapi

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
