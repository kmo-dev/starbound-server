FROM ubuntu:20.04

LABEL authors="klemens@morbe.online"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.utf8

RUN apt-get update && \
    apt-get install -y locales lib32gcc1 curl software-properties-common libvorbisfile3 && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /server-data/steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

WORKDIR /server-data/starbound

COPY entrypoint.sh /server-data/entrypoint.sh
RUN chmod +x /server-data/entrypoint.sh
ENTRYPOINT ["/server-data/entrypoint.sh"]

EXPOSE 21025 21026
CMD ["./linux/starbound_server"]

ENV DEBIAN_FRONTEND=""
