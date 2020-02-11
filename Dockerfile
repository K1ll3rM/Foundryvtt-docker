FROM node:12-alpine

MAINTAINER K1ll3rM

RUN apk add --no-cache --update unzip bash su-exec \
    && mkdir -m 777 /home/container \
    && adduser --u 2000 -D -h /home/container container

WORKDIR /home/container

EXPOSE 30000

COPY ./start /start
RUN dos2unix /start

USER root
ENV  USER=container HOME=/home/container

CMD ["id", "-u"]
#CMD ["su-exec", "container", "/bin/bash", "/start"]