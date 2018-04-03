FROM node:8-alpine

RUN unsafe-perm true
RUN npm install -g yapi-cli --registry=https://registry.npm.taobao.org 

# 更改APK源
RUN cp /etc/apk/repositories /etc/apk/repositories.bak
RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" > /etc/apk/repositories

RUN apk update
RUN apk add --no-cache make python git


WORKDIR /my-yapi
ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
