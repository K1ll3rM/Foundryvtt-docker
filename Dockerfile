FROM node:12-alpine

MAINTAINER K1ll3rM, <k1ll3rM.99@gmail.com>

RUN apk add --no-cache --update unzip bash \
    && adduser -D -h /home/container container \
    && chmod 777 container

WORKDIR /home/container

COPY ./start /start
RUN dos2unix /start

USER container
ENV  USER=container HOME=/home/container

CMD ["/bin/bash", "/start"]