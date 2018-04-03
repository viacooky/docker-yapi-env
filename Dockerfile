FROM node:8.5.0-alpine

# 更改APK源
RUN cp /etc/apk/repositories /etc/apk/repositories.bak
RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" > /etc/apk/repositories

RUN apk update
RUN apk add --no-cache make python git

RUN npm config set unsafe-perm true
RUN mkdir /.npm-global
RUN NPM_CONFIG_PREFIX=/.npm-global
RUN npm install -g yapi-cli --registry=https://registry.npm.taobao.org 



RUN mkdir /my-yapi
WORKDIR /my-yapi

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
