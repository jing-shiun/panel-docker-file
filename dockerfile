  
FROM ubuntu:20.04

MAINTAINER shiunchen
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends git nodejs openjdk-11-jdk 
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata 
RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
RUN git clone https://github.com/jing-shiun/panel-docker-file.git
COPY ./panel-docker-file/entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
