FROM node:12

MAINTAINER K1ll3rM

RUN apt-get install unzip bash \
    && mkdir -m 777 /home/container \
    && adduser --u 2000 -D -h /home/container container

WORKDIR /home/container

COPY ./start /start
RUN dos2unix /start

USER container
ENV  USER=container HOME=/home/container

CMD ["/bin/bash", "/start"]