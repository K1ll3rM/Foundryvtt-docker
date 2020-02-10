FROM node:12-stretch

MAINTAINER K1ll3rM

RUN apt-get update
RUN apt-get install dos2unix

RUN apt-get install unzip bash \
    && mkdir -m 777 /home/container \
    && adduser --home /home/container container

WORKDIR /home/container

COPY ./start /start
RUN dos2unix /start

USER container
ENV  USER=container HOME=/home/container

CMD ["/bin/bash", "/start"]