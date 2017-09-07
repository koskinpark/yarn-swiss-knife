FROM mhart/alpine-node:8.2.1


RUN apk add --no-cache make g++ python git

WORKDIR /vendor

COPY docker-entrypoint.sh /usr/local/bin/

ADD https://raw.githubusercontent.com/skilld-labs/zen/8.x-7.x/STARTERKIT/package.json /vendor

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
  && cd /vendor \
  && yarn install --ignore-scripts

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["yarn", "run", "gulp"]
