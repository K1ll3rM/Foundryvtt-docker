FROM node:12-alpine

MAINTAINER K1ll3rM, <k1ll3rM.99@gmail.com>

RUN apk add --no-cache --update unzip bash \
    && adduser -D -h /home/container container \
    && chown -R container /home/container \
    && chmod -R +rwx /home/container

WORKDIR /home/container

COPY ./start /start

RUN dos2unix /start
CMD ["/bin/bash", "/start"]

USER container
ENV  USER=container HOME=/home/container