FROM ubuntu:20.04

LABEL authors="klemens@morbe.online"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y locales lib32gcc1 curl software-properties-common libvorbisfile3 apt-utils

RUN locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

WORKDIR /server-data
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

COPY entrypoint.sh /server-data/entrypoint.sh
RUN chmod +x /server-data/entrypoint.sh
ENTRYPOINT ["/server-data/entrypoint.sh"]

EXPOSE 21025 21026
