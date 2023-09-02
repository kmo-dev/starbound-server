FROM ubuntu:22.04
LABEL authors="klemens@morbe.online"

ENV DEBIAN_FRONTEND=noninteractive

ARG STEAM_USERNAME
ARG STEAM_PASSWORD

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc1 curl software-properties-common libvorbisfile3 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

WORKDIR /starbound

RUN /steamcmd/steamcmd.sh \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +force_install_dir /starbound \
    +app_update 211820 \
    +quit

EXPOSE 21025

CMD ["./linux/starbound_server"]

ENV DEBIAN_FRONTEND=""
