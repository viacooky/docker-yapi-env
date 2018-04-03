FROM node:9-alpine

RUN groupadd --gid 1000 yapi && \
    useradd --uid 1000 --gid yapi --create-home yapi

WORKDIR /home/yapi

RUN chown -R yapi:yapi /home/yapi
USER yapi

RUN npm install -g yapi-cli --registry=https://registry.npm.taobao.org 

ENTRYPOINT ["node"]
CMD ["vendors/server/app.js"]
