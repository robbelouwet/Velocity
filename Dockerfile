FROM --platform=linux/amd64 ubuntu:latest

EXPOSE 25565/tcp
EXPOSE 25565/udp

WORKDIR /

COPY ./docker/entrypoint.sh /entrypoint.sh
COPY ./proxy/build/libs/*-all.jar /velocity.jar

COPY ./docker/template-files/* /

RUN apt-get update && apt-get install -y wget git openjdk-17-jre perl

RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 &&\
    chmod a+x /usr/local/bin/yq

CMD [ "/bin/bash", "-c", "/entrypoint.sh" ]