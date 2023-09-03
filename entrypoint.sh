#!/bin/bash
set -e

cd /

/server-data/steamcmd.sh \
    +force_install_dir /server-data/starbound \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +app_update 211820 validate \
    +quit

ls -la

cd /server-data/starbound/linux

exec ./starbound_server
