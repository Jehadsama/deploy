FROM node As npminstall
LABEL maintainer="Jehadsama<339364351@qq.com>"

WORKDIR /tmp
COPY package*.json ./
ENV NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node NPM_CONFIG_REGISTRY=https://registry.npm.taobao.org
RUN npm i --production --verbose

FROM node:alpine
WORKDIR /src-app
COPY . ./
COPY --from=npminstall /tmp/node_modules /src-app/node_modules
EXPOSE 9000
ENTRYPOINT ["node", "app.js"]
