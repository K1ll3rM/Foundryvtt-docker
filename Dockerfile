FROM node:12-alpine

MAINTAINER K1ll3rM

RUN apk add --no-cache --update unzip bash su-exec \
    && mkdir -m 777 /home/container \
    && adduser --u 2000 -D -h /home/container container

WORKDIR /home/container
RUN chmod -R 777 /home/container

EXPOSE 30000

COPY ./start /start
RUN dos2unix /start

COPY ./addUID /addUID
RUN chmod +x /addUID
RUN bash /addUID

USER container
ENV  USER=container HOME=/home/container

CMD ["/bin/bash", "/start"]