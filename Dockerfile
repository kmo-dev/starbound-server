FROM ubuntu:20.04
LABEL authors="klemens@morbe.online"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y lib32gcc1 curl software-properties-common libvorbisfile3
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

WORKDIR /starbound

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 21025

CMD ["./linux/starbound_server"]

ENV DEBIAN_FRONTEND=""
