FROM node:11-alpine

WORKDIR /app

COPY package.json .yarnrc yarn.lock ./
COPY docker-entrypoint.sh /usr/local/bin/

RUN apk add --no-cache make gcc g++ python git

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
  && cd /app \
  && yarn install --ignore-optional \
  && apk del --no-cache --purge make gcc g++ python \
  && rm -rf node_modules

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["yarn", "run", "build"]
