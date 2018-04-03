FROM node:8-alpine

RUN npm config set unsafe-perm true
RUN mkdir /.npm-global
RUN NPM_CONFIG_PREFIX=/.npm-global
RUN npm install -g yapi-cli --registry=https://registry.npm.taobao.org 

# 更改APK源
RUN cp /etc/apk/repositories /etc/apk/repositories.bak
RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" > /etc/apk/repositories

RUN apk update
RUN apk add --no-cache make python git

RUN mkdir /my-yapi
WORKDIR /my-yapi
ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
