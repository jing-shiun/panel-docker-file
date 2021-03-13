FROM ubuntu:20.04

MAINTAINER shiunchen
RUN apt update && apt -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends curl openjdk-11-jdk npm gcc g++ make tzdata
RUN npm i -g n
RUN n 12
RUN apt remove -y nodejs npm
RUN apt -y autoremove
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata
RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
