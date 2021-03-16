FROM ubuntu:20.04

MAINTAINER shiunchen
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends curl openjdk-11-jdk npm gcc g++ make tzdata ca-certificates openssl git tar sqlite fontconfig nodejs
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata
RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
RUN cd /home/container
CMD ["/nodejs/bin/npm", "start"]
