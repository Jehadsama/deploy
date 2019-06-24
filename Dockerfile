FROM node
LABEL maintainer="Jehadsama<339364351@qq.com>"

COPY ./ /src-app
RUN npm config set registry https://registry.npm.taobao.org && \
  cd /src-app && \
  NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node npm i --production --verbose
WORKDIR /src-app
EXPOSE 9000
ENTRYPOINT ["npm", "run"]
CMD ["start"]
