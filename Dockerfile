FROM node:12-alpine

MAINTAINER K1ll3rM

RUN apk add --no-cache --update unzip bash \
    && mkdir -m 777 /home/container \
    && adduser --u 2000 -D -h /home/container container \
    && useradd -u 999 -d /home/container -ms /bin/bash pterdactyl

WORKDIR /home/container

COPY ./start /start
RUN dos2unix /start

USER container
ENV  USER=container HOME=/home/container

CMD ["/bin/bash", "/start"]