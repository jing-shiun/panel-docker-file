FROM ubuntu:20.04

MAINTAINER shiunchen
RUN apt update
RUN apt install -y git nodejs openjdk-11-jdk 
RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
RUN git clone https://github.com/jing-shiun/panel-docker-file.git
COPY /panel-docker-file/entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
